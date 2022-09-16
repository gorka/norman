require 'test_helper'

class BookPolicyTest < ActiveSupport::TestCase
  setup do
    @book = books(:one)
  end

  # guest
  
  test "can view a list of books" do
    user = nil
    assert Pundit.policy(user, @book).index?
  end
  
  test "can view a book" do
    user = nil
    assert Pundit.policy(user, @book).show?
  end

  test "cannot create a new book" do
    user = nil
    refute Pundit.policy(user, @book).new?
  end

  test "cannot post a new book" do
    user = nil
    refute Pundit.policy(user, @book).create?
  end

  test "cannot edit a book" do
    user = nil
    refute Pundit.policy(user, @book).edit?
  end

  test "cannot update a book" do
    user = nil
    refute Pundit.policy(user, @book).update?
  end

  test "cannot delete a book" do
    user = nil
    refute Pundit.policy(user, @book).destroy?
  end
end
