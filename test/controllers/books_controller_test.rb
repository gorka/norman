require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @owner = users(:one)
  end

  # guest

  test "guest should get index" do
    get books_url
    assert_response :success
  end

  test "guest should redirect on get new" do
    get new_book_url
    assert_redirected_to new_user_session_path
  end


  test "guest should redirect on create book" do
    assert_difference("Book.count", 0) do
      post books_url, params: { book: { author: @book.author, description: @book.description, isbn: @book.isbn, subtitle: @book.subtitle, title: @book.title, web: @book.web } }
    end

    assert_redirected_to new_user_session_path
  end

  test "guest should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "guest should redirect on get edit" do
    get edit_book_url(@book)
    assert_redirected_to new_user_session_path
  end

  test "guest should redirect on update book" do
    patch book_url(@book), params: { book: { author: @book.author } }
    assert_redirected_to new_user_session_path
  end

  test "guest sould redirect on destroy book" do
    assert_difference("Book.count", 0) do
      delete book_url(@book)
    end
    
    assert_redirected_to new_user_session_path
  end

  # user

  test "should get index" do
    sign_in @owner
    get books_url
    assert_response :success
  end

  test "should get new" do
    sign_in @owner
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    sign_in @owner
    assert_difference("Book.count") do
      post books_url, params: { book: { author: @book.author, description: @book.description, isbn: @book.isbn, subtitle: @book.subtitle, title: @book.title, web: @book.web } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    sign_in @owner
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    sign_in @owner
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    sign_in @owner
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, isbn: @book.isbn, subtitle: @book.subtitle, title: @book.title, web: @book.web } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    sign_in @owner
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
