class Read < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_rich_text :comment

  validates :date, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
