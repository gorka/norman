class Movie < ApplicationRecord
  has_many :views, as: :viewable
end
