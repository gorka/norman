require "test_helper"

class BookTest < ActiveSupport::TestCase
  setup do
    @book = books(:one)
  end

  test "valid" do
    assert @book.valid?
  end

  test "invalid if empty title" do
    @book.title = nil
    refute @book.valid?
    refute @book.errors[:title].empty?
  end

  test "invalid if empty author" do
    @book.author = nil
    refute @book.valid?
    refute @book.errors[:author].empty?
  end

  test "invalid if isbn is not a number" do
    @book.isbn = "string"
    refute @book.valid?
    refute @book.errors[:isbn].empty?
  end

  test "invalid if isbn is less than 10 chars" do
    @book.isbn = 123456789
    refute @book.valid?
    refute @book.errors[:isbn].empty?
  end

  test "invalid if isbn is more than 13 chars" do
    @book.isbn = 12345678910111
    refute @book.valid?
    refute @book.errors[:isbn].empty?
  end
end
