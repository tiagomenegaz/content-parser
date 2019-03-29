module Api
  module V1
    class ContentResource < JSONAPI::Resource
      attributes :value, :kind, :created_at
      has_one :page

      filter :page
    end
  end
end