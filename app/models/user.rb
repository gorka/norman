class User < ApplicationRecord
  devise :database_authenticatable, :rememberable
  has_many :views
end
