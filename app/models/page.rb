class Page < ApplicationRecord
  has_many :contents

  validates :original_url, presence: true, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/ix }

  after_save do
    Contents::Creator.new(page: self).call
  end
end
