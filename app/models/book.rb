class Book < ApplicationRecord
  has_many :reads, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, length: { in: 10..13 }, numericality: { only_integer: true }
end
