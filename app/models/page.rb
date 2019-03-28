class Page < ApplicationRecord
  validates :original_url, presence: true
end
