require 'test_helper'

class TourTest < ActiveSupport::TestCase
  test "add tour valid" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    assert tour.save!
  end

  test "add tour nil name" do
    tour = Tour.new do |t|
      t.name = nil
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil description" do
    tour = Tour.new do |t|
      t.name = "Miami"
      t.description = nil
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil deadline" do
    tour = Tour.new do |t|
      t.name = 'Miami'
      t.description = 'A tour to Miami'
      t.deadline = nil
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil start_date" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = nil
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil end_date" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = nil
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil start_location" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = nil
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil country" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = nil
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil state" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = nil
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil total_seats" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = nil
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour non-numerical total_seats" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 'ab'
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil price" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = nil
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour non-numerical price" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 'ab'
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour nil user_id" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = nil
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour end_date earlier than start_date" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "add tour start_date earlier than deadline" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('3/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    begin
      assert_not tour.save!
    rescue
      assert_not tour.id
    end
  end

  test "check is complete" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2050', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    tour.save!
    assert_not tour.is_completed?
  end

  test "show agent informaiton" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    tour.save!
    assert_equal("Name: MyString Email: bob@test.com", tour.show_agent_info)
  end

  test "check status canceled" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('03/01/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('03/05/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
      t.canceled = true
    end
    tour.save!
    assert_equal("Canceled", tour.show_status)
  end

  test "check status completed" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('02/17/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('02/19/2019', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    tour.save!
    assert_equal("Completed", tour.show_status)
  end

  test "check status On Going" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('02/17/2019', "%m/%d/%Y")
      t.end_date = Date.strptime('02/19/2050', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    tour.save!
    assert_equal("On Going", tour.show_status)
  end

  test "check status In Future" do
    tour = Tour.new do |t|
      t.name = 'Miami Tour'
      t.description = 'A tour to Miami'
      t.deadline = Date.strptime('2/14/2019', "%m/%d/%Y")
      t.start_date = Date.strptime('02/17/2050', "%m/%d/%Y")
      t.end_date = Date.strptime('02/19/2050', "%m/%d/%Y")
      t.start_location = 'Raleigh'
      t.country = 'USA'
      t.state = 'FL'
      t.total_seats = 20
      t.price = 500
      t.user_id = users(:one).id
    end
    tour.save!
    assert_equal("In Future", tour.show_status)
  end

  test "check requested seats" do
    assert_equal(3, tours(:one).tour_requested_seats)
  end

  test "check available seats" do
    assert_equal(17, tours(:one).available_seats)
  end

end