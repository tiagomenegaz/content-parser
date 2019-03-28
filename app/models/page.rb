class Page < ApplicationRecord
  has_many :contents

  validates :original_url, presence: true
end
