require "test_helper"

class ReadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @read = reads(:one)
    @owner = users(:one)
    @not_owner = users(:two)
  end

  # guest

  test "guest can get reads" do
    get reads_path
    assert_response :success
  end

  test "guest can get read" do
    get read_path(@read)
    assert_response :success
  end

  test "guest cannot get new" do
    get new_book_read_path(@book)
    assert_redirected_to new_user_session_path
  end

  test "guest cannot post create" do
    assert_no_difference("Read.count") do
      post book_reads_path(@book), params: { read: { rating: 1} }
    end

    assert_redirected_to new_user_session_path
  end

  test "guest cannot get edit" do
    get edit_read_path(@read)
    assert_redirected_to new_user_session_path
  end

  test "guest cannot post update" do
    patch read_path(@read)
    assert_redirected_to new_user_session_path
  end

  test "guest cannot destroy" do
    assert_no_difference("Read.count") do
      delete read_path(@read)
    end

    assert_redirected_to new_user_session_path
  end

  # user (owner)

  test "user can get reads" do
    sign_in @owner
    get reads_path
    assert_response :success
  end

  test "user can get read" do
    sign_in @owner
    get read_path(@read)
    assert_response :success
  end

  test "user can get new" do
    sign_in @owner
    get new_book_read_path(@book)
    assert_response :success
  end

  test "user can post create" do
    sign_in @owner
    assert_difference("Read.count", 1) do
      post book_reads_path(@book), params: { read: { rating: @read.rating, date: @read.date } }
    end

    assert_redirected_to read_path(Read.last)
  end

  test "owner can get edit" do
    sign_in @owner
    get edit_read_path(@read)
    assert_response :success
  end

  test "owner can post update" do
    sign_in @owner
    patch read_path(@read), params: { read: { rating: @read.rating } }
    assert_redirected_to read_path(@read)
  end

  test "owner can destroy" do
    sign_in @owner
    assert_difference("Read.count", -1) do
      delete read_path(@read)
    end

    assert_redirected_to root_path
  end

  # user (not owner)

  test "not owner cannot get edit" do
    sign_in @not_owner
    get edit_read_path(@read)
    assert_redirected_to root_path
  end

  test "no owner cannot post update" do
    sign_in @not_owner
    patch read_path(@read), params: { read: { rating: @read.rating } }
    assert_redirected_to root_path
  end

  test "not owner cannot destroy" do
    sign_in @not_owner
    assert_no_difference("Read.count") do
      delete read_path(@read)
    end
    
    assert_redirected_to root_path
  end
end
