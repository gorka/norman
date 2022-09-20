require "application_system_test_case"

class ReadsTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    @read = reads(:one)
    @user = users(:one)
  end

  test "should create a read" do
    sign_in @user

    visit book_url(@book)
    click_on "Añadir lectura"

    select "2019", from: "read_date_1i"
    select "October", from: "read_date_2i"
    select "31", from: "read_date_3i"
    select "3", from: "read_rating"
    click_on "New read"

    assert_text "Read added!"
    assert_text "31 Oct 2019"
  end

  test "should update a Read" do
    sign_in @user

    visit read_url(@read)
    click_on "Edit"

    select "2020", from: "read_date_1i"
    select "August", from: "read_date_2i"
    select "30", from: "read_date_3i"
    select "3", from: "read_rating"
    click_on "Edit read"

    assert_text "Read edited successfully."
    assert_text "30 Aug 2020"
  end

  test "should destroy Read" do
    sign_in @user

    visit read_url(@read)
    click_on "Edit"

    accept_alert "Are you sure?" do
      click_on "Delete"
    end

    assert_text "Read deleted successfully."
  end
end

