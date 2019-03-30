module Contents
  class Creator
    def initialize(params)
      @page = params.fetch(:page)
    end

    def call
      fields = parse_fields
      bulk_insertion(fields)
    end

    private

    attr_reader :page

    def parse_fields
      service   = Contents::Parser.new(base_url: page.original_url)
      timestamp = DateTime.now

      service.call.map do |field|
        field.merge({
          page_id: page.id,
          created_at: timestamp,
          updated_at: timestamp
        })
      end
    end

    def bulk_insertion(fields)
      columns    = fields.first.keys.join(',')
      attributes = fields.map { |field| format_query_values(field.values) }.join(',')
      ActiveRecord::Base.connection.execute("INSERT INTO contents (#{columns}) VALUES #{attributes}")
    rescue Exception => e
      Logs::Register.new(url: page.original_url, message: e.message).call
    end

    def format_query_values(values)
      content = values.map { |attribute| "'#{ attribute.to_s.gsub("'", "`") }'" }.join(',')
      "(#{content})"
    end
  end
end