require 'test_helper'

class ReadPolicyTest < ActiveSupport::TestCase
  setup do
    @read = reads(:one)
    @guest = nil
    @owner = users(:one)
    @not_owner = users(:two)
  end

  # guest

  test "guest can index" do
    assert Pundit.policy(@guest, @read).index?
  end

  test "guest can show" do
    assert Pundit.policy(@guest, @read).show?
  end

  test "guest cannot new" do
    refute Pundit.policy(@guest, @read).new?
  end

  test "guest cannot create" do
    refute Pundit.policy(@guest, @read).create?
  end

  test "guest cannot edit" do
    refute Pundit.policy(@guest, @read).edit?
  end

  test "guest cannot update" do
    refute Pundit.policy(@guest, @read).update?
  end

  test "guest cannot destroy" do
    refute Pundit.policy(@guest, @read).destroy?
  end

  # user (owns read)

  test "user can index" do
    assert Pundit.policy(@owner, @read).index?
  end

  test "user can show" do
    assert Pundit.policy(@owner, @read).show?
  end

  test "user can new" do
    assert Pundit.policy(@owner, @read).new?
  end

  test "user can create" do
    assert Pundit.policy(@owner, @read).create?
  end

  test "owner can edit" do
    assert Pundit.policy(@owner, @read).edit?
  end

  test "owner can update" do
    assert Pundit.policy(@owner, @read).update?
  end

  test "owner can destroy" do
    assert Pundit.policy(@owner, @read).destroy?
  end

  #user (does not own read)

  test "not owner cannot edit" do
    refute Pundit.policy(@not_owner, @read).edit?
  end

  test "not owner cannot update" do
    refute Pundit.policy(@not_owner, @read).update?
  end

  test "not owner cannot destroy" do
    refute Pundit.policy(@not_owner, @read).destroy?
  end

end
