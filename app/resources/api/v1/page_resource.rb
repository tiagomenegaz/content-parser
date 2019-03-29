module Api
  module V1
    class PageResource < JSONAPI::Resource
      attributes :original_url

      has_many :contents
    end
  end
end