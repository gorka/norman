class View < ApplicationRecord
  belongs_to :user
  belongs_to :viewable, polymorphic: true

  has_rich_text :comment
end
