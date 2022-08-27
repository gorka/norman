class MoviePolicy < ApplicationPolicy
  def show?
    true
  end

  def search?
    user.present?
  end
end

