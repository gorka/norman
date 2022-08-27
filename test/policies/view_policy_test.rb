require 'test_helper'

class ViewPolicyTest < ActiveSupport::TestCase
  setup do
    @view = views(:one)
  end

  # GUEST

  test "can view a view" do
    user = nil
    assert Pundit.policy(user, @view).show?
  end

  test "cannot create a new view" do
    user = nil
    refute Pundit.policy(user, View).new?
  end

  test "cannot post a new view" do
    user = nil
    refute Pundit.policy(user, View).create?
  end

  test "cannot update a new view" do
    user = nil
    refute Pundit.policy(user, View).edit?
  end

  test "cannot post an updated view" do
    user = nil
    refute Pundit.policy(user, View).update?
  end

  test "cannot delete a view" do
    user = nil
    refute Pundit.policy(user, @view).destroy?
  end

  # USER (OWNS THE VIEW)

  test "can view it's own view" do
    user = users(:one)
    assert Pundit.policy(user, @view).show?
  end

  test "can create a new view" do
    user = users(:one)
    assert Pundit.policy(user, View).new?
  end

  test "can post a new view" do
    user = users(:one)
    assert Pundit.policy(user, View).create?
  end

  test "can update it's own view" do
    user = users(:one)
    assert Pundit.policy(user, @view).edit?
  end

  test "can post an update to it's own view" do
    user = users(:one)
    assert Pundit.policy(user, @view).update?
  end

  test "can destroy it's own view" do
    user = users(:one)
    assert Pundit.policy(user, @view).destroy?
  end

  # USER (DOES NOT OWN THE VIEW)

  test "can view another user's view" do
    user = users(:two)
    assert Pundit.policy(user, @view).show?
  end

  test "cannot update another user's view" do
    user = users(:two)
    refute Pundit.policy(user, @view).edit?
  end

  test "cannot post an update to another user's view" do
    user = users(:two)
    refute Pundit.policy(user, @view).update?
  end

  test "cannot destroy another user's view" do
    user = users(:two)
    refute Pundit.policy(user, @view).destroy?
  end
end
