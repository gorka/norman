require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    @user = users(:one)
  end

  # guest

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Libros"
  end

  test "index should not have new book link" do
    visit books_url

    refute_text "New book"
  end

  test "show book should not have edit & destroy links" do
    visit book_url(@book)

    refute_text "Edit book"
    refute_text "Destroy book"
  end

  # user

  test "should create book" do
    sign_in @user

    visit books_url
    click_on "New book"

    fill_in "Author", with: @book.author
    fill_in "Description", with: @book.description
    fill_in "Isbn", with: @book.isbn
    fill_in "Subtitle", with: @book.subtitle
    fill_in "Title", with: @book.title
    fill_in "Web", with: @book.web
    click_on "Create Book"

    assert_text "Book was successfully created"
  end

  test "should update Book" do
    sign_in @user

    visit book_url(@book)
    click_on "Edit book", match: :first

    fill_in "Author", with: @book.author
    fill_in "Description", with: @book.description
    fill_in "Isbn", with: @book.isbn
    fill_in "Subtitle", with: @book.subtitle
    fill_in "Title", with: @book.title
    fill_in "Web", with: @book.web
    click_on "Update Book"

    assert_text "Book was successfully updated"
  end

  test "should destroy Book" do
    sign_in @user

    visit book_url(@book)
    click_on "Destroy book", match: :first

    assert_text "Book was successfully destroyed"
  end
end
