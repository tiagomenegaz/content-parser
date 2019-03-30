module Logs
  class Register
    def initialize(params)
      @url     = params.fetch(:url)
      @message = params.fetch(:message)
    end

    def call
      Rails.logger = Logger.new("#{Rails.root}/log/errors.log")
      messages.each { |message| Rails.logger.fatal(message) }
    end

    private

    attr_reader :url, :message

    def messages
      [
        "---"*20,
        "The following page has content that clouldn't be parsed #{url}",
        "Error #{message}",
        "Registered at #{DateTime.now}",
        "---"*20
      ]
    end
  end
end