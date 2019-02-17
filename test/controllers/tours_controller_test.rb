require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:one)
  end

  test "should get index" do
    get tours_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_url
    assert_response :success
  end

  test "should create tour" do
    assert_difference('Tour.count') do
      post tours_url, params: { tour: { canceled: @tour.canceled, country: @tour.country, deadline: @tour.deadline, description: @tour.description, end_date: @tour.end_date, image: @tour.image, name: @tour.name, price: @tour.price, start_date: @tour.start_date, start_location: @tour.start_location, state: @tour.state, total_seats: @tour.total_seats, user_id: @tour.user_id } }
    end

    assert_redirected_to tour_url(Tour.last)
  end

  test "should show tour" do
    get tour_url(@tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_url(@tour)
    assert_response :success
  end

  test "should update tour" do
    patch tour_url(@tour), params: { tour: { canceled: @tour.canceled, country: @tour.country, deadline: @tour.deadline, description: @tour.description, end_date: @tour.end_date, image: @tour.image, name: @tour.name, price: @tour.price, start_date: @tour.start_date, start_location: @tour.start_location, state: @tour.state, total_seats: @tour.total_seats, user_id: @tour.user_id } }
    assert_redirected_to tour_url(@tour)
  end

  test "should destroy tour" do
    assert_difference('Tour.count', -1) do
      delete tour_url(@tour)
    end

    assert_redirected_to tours_url
  end
end
