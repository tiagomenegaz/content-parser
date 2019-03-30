require "open-uri"

module Contents
  class Parser
    def initialize(params)
      url       = params.fetch(:base_url)
      @base_url = url.last == '/' ? url.chop : url
    end

    def call
      document = Nokogiri::HTML.parse(open(base_url))

      Content.kinds.keys.map do |tag|
        document.css(tag).map do |element|
          content = find_content(element)
          next if content.nil? || content == "#"

          content = amend_base_url(content) if element.name == 'a'

          {
            kind: tag,
            value: content
          }
        end.compact
      end.flatten
    end

    private

    attr_reader :base_url

    def find_content(element)
      content = element.name == 'a' ? element[:href] : element.text
      content.strip if content.present?
    end

    def amend_base_url(content)
      content.first == '/' ? (base_url + content) : content
    end
  end
end