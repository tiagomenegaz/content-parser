class Content < ApplicationRecord
  enum kind: {
    h1: "h1",
    h2: "h2",
    h3: "h3",
    link: "link"
  }

  validates :kind, :value, presence: true
  validates :kind, inclusion: { in: Content.kinds.keys }
end

