require "test_helper"

class ReadTest < ActiveSupport::TestCase
  setup do
    @read = reads(:one)
  end

  test "valid" do
    assert @read.valid?
  end

  test "invalid if no user" do
    @read.user = nil
    refute @read.valid?
    refute @read.errors[:user].empty?
  end

  test "invalid if no book" do
    @read.book = nil
    refute @read.valid?
    refute @read.errors[:book].empty?
  end

  test "invalid if no date" do
    @read.date = nil
    refute @read.valid?
    refute @read.errors[:date].empty?
  end

  test "invalid if no rating" do
    @read.rating = nil
    refute @read.valid?
    refute @read.errors[:rating].empty?
  end

  test "invalid if rating is less than 0" do
    @read.rating = -1
    refute @read.valid?
    refute @read.errors[:rating].empty?
  end

  test "invalid if rating is greater than 5" do
    @read.rating = 6
    refute @read.valid?
    refute @read.errors[:rating].empty?
  end
end

