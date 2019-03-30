class Page < ApplicationRecord
  has_many :contents

  validates :original_url, presence: true

  after_save do
    Contents::Creator.new(page: self).call
  end
end
