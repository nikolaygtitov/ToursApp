class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:get, :show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @bookings = Booking.find(params[:id])
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  def new_with_waitlist
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    tour = Tour.find(params[:tour_id])
    @booking.user_id = current_user.id
    @booking.tour_id = tour.id
    @booking.booked_seats = 0 if @booking.booked_seats.nil?
    @booking.waitlist_seats = 0 if @booking.waitlist_seats.nil?
    booking = tour.find_booking(current_user.id)

    respond_to do |format|
      if tour.available_seats < @booking.booked_seats
        format.html { redirect_to new_with_waitlist_path(tour_id: tour.id, default_booked_seats: tour.available_seats, default_waitlist_seats: @booking.waitlist_seats + @booking.booked_seats - tour.available_seats), alert: 'Not enough available seats to Book.' }
      elsif !booking.nil? && !booking.blank?
        booking.update_attributes(booked_seats: @booking.booked_seats, waitlist_seats: @booking.waitlist_seats, created_at: Time.now)
        format.html { redirect_to booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: booking }
      elsif @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    @booking.booked_seats = 0 if @booking.booked_seats.nil?
    @booking.waitlist_seats = 0 if @booking.waitlist_seats.nil?

    respond_to do |format|
      if @booking.update(booking_params)
        @booking.fill_available_seats
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    if @booking.bookmark
      @booking.booked_seats = 0
      @booking.waitlist_seats = 0
      @booking.update_attributes(booked_seats: @booking.booked_seats, waitlist_seats: @booking.waitlist_seats)
      @booking.fill_available_seats
      respond_to do |format|
        format.html { redirect_to my_bookings_url, notice: 'Booking was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      @booking.destroy
      respond_to do |format|
        format.html { redirect_to my_bookings_url, notice: 'Booking was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  # GET /my_bookings
  # GET /my_bookings.json
  def my_bookings
    @bookings = Booking.all
  end

  # GET /my_customers_booked
  # GET /my_customers_booked.json
  def my_customers_booked
    @bookings = Booking.where(tour_id: params[:tour_id])
    @tour = Tour.find_by(id: params[:tour_id])
  end

  # GET /my_customers_bookmarked
  # GET /my_customers_bookmarked.json
  def my_customers_bookmarked
    @bookings = Booking.where(tour_id: params[:tour_id])
    @tour = Tour.find_by(id: params[:tour_id])
  end

  # GET /bookmark
  # GET /bookmark.json
  def bookmark
    if params[:tour_id].nil? || params[:tour_id].blank?
      respond_to do |format|
        format.html { redirect_to tours_url, alert: 'Unchecked Tours cannot be Bookmarked!!!' }
        format.json { render get, status: :ok, location: tours_url }
      end
    else
      params[:tour_id].each do |tour_id|
        booking = Booking.find_by(user_id: current_user.id, tour_id: tour_id)
        if booking.nil? || booking.blank?
          Booking.create!(booked_seats: 0, user_id: current_user.id, tour_id: tour_id, waitlist_seats: 0, bookmark: true)
        else
          booking.update_attribute(:bookmark, true)
        end
      end
      respond_to do |format|
        if params[:tour_id].length == 1
          format.html { redirect_to Tour.find(params[:tour_id]), notice: 'Tour was successfully Bookmarked.' }
          format.json { render :show, status: :ok, location: Tour.find(params[:tour_id]) }
        else
          format.html { redirect_to tours_url, notice: 'Tours were successfully Bookmarked.' }
          format.json { render :get, status: :ok, location: tours_url }
        end
      end
    end
  end

  # GET /undo_bookmark
  # GET /undo_bookmark.json
  def undo_bookmark
    if params[:tour_id].nil? || params[:tour_id].blank?
      respond_to do |format|
        format.html { redirect_to customer_bookmarks_url, alert: 'Unchecked Tours cannot be Unbookmarked!!!' }
        format.json { render get, status: :ok, location: tours_url }
      end
    else
      params[:tour_id].each do |tour_id|
        booking = Booking.find_by(user_id: current_user.id, tour_id: tour_id)
        booking.update_attribute(:bookmark, false)
        if booking.booked_seats.zero? && booking.waitlist_seats.zero?
          booking.destroy
        end
      end
      respond_to do |format|
        format.html { redirect_to customer_bookmarks_url, notice: 'Unbookmark is successful.' }
        format.json { render :get, status: :ok, location: customer_bookmarks_url }
      end
    end
  end

  # GET /customer_bookmarks
  # GET /customer_bookmarks.json
  def customer_bookmarks
    @bookings = Booking.all
  end

  # GET /agent_bookmarks
  # GET /agent_bookmarks.json
  def agent_bookmarks
    @bookings = Booking.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:booked_seats, :waitlist_seats, :user_id, :tour_id)
    end
end
