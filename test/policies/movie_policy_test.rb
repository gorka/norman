require 'test_helper'

class MoviePolicyTest < ActiveSupport::TestCase
  setup do
    @movie = movies(:one)
  end

  # GUEST

  test "can view a movie" do
    user = nil
    assert Pundit.policy(user, @movie).show?
  end

  test "cannot search for a movie" do
    user = nil
    refute Pundit.policy(user, Movie).search?
  end

  # USER

  test "can also view a movie" do
    user = users(:one)
    assert Pundit.policy(user, @movie).show?
  end

  test "can search for a movie" do
    user = users(:one)
    assert Pundit.policy(user, Movie).search?
  end
end
