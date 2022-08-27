require "test_helper"

class ViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @view = views(:one)
  end

  # GUEST

  test "gues can get views" do
    get views_path
    assert_response :success
  end

  test "guest can get view" do
    view = views(:one)
    get view_path(view)
    assert_response :success
  end

  test "guest cannot get new" do
    movie = movies(:one)
    get new_movie_view_path(movie)
    assert_response :redirect
  end

  test "guest cannot post create" do
    movie = movies(:one)
    post movie_views_path(movie), params: { view: { rating: 1 } }
    assert_response :redirect
  end

  test "guest cannot get edit" do
    get edit_view_path(@view)
    assert_response :redirect
  end

  test "guest cannot post update" do
    patch view_path(@view)
    assert_response :redirect
  end

  test "guest cannot destroy a view" do
    delete view_url(@view)
    assert_response :redirect
  end

  # USER (OWNS VIEW)

  test "user can get views" do
    get views_path
    assert_response :success
  end

  test "user can get view" do
    get view_path(@view)
    assert_response :success
  end

  test "user can get new view" do
    sign_in users(:one)
    movie = movies(:one)
    get new_movie_view_path(movie)
    assert_response :success
  end

  test "user can post create view" do
    sign_in users(:one)
    movie = movies(:one)
    assert_difference("View.count", 1) do
      post movie_views_path(movie), params: { view: { rating: 1 } }
    end

    assert_redirected_to view_path(View.last)
  end

  test "user can get edit it's own view" do
    sign_in users(:one)
    get edit_view_path(@view)
    assert_response :success
  end

  test "user can post update it's own view" do
    sign_in users(:one)
    patch view_url(@view), params: { view: { rating: 3 } }
    assert_redirected_to view_url(@view)
  end

  test "user can destroy it's own view" do
    sign_in users(:one)
    assert_difference("View.count", -1) do
      delete view_url(@view)
    end

    assert_redirected_to root_path
  end

  # USER (DOES NOT OWN VIEW)

  test "user cannot get edit another user's view" do
    sign_in users(:two)
    get edit_view_path(@view)
    assert_response :redirect
  end

  test "user cannot post update another user's view" do
    sign_in users(:two)
    patch view_url(@view), params: { view: { rating: 3 } }
    assert_response :redirect
  end

  test "user cannot destroy another user's view" do
    sign_in users(:two)
    delete view_url(@view)
    assert_response :redirect
  end
end
