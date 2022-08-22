class MoviePolicy < ApplicationPolicy
  def search?
    user.present?
  end
end

