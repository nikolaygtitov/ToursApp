class ToursController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tour, only: [:show, :edit, :update, :destroy, :cancel_tour]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
    if params[:search]
      @search = TourSearch.new(params[:search])
      @tours = @search.scope
      @tours = {} if @tours.nil?
    end
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @tours = Tour.find(params[:id])
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id
    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        booking = Booking.find_by(tour_id: @tour.id)
        booking.fill_available_seats unless booking.nil?
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancel_tour
    @tour.update_attribute(:canceled, true)
    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully Cancelled.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /search
  # GET /search.json
  def search
    @search = TourSearch.new(params[:search])
    @tours = @search.scope
  end

  # GET /image
  # GET /image.json
  def image
    @tour = Tour.find(params[:tour_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:name, :description, :price, :image, :deadline, :start_date, :end_date, :start_location, :country, :state, :total_seats, :canceled, :user_id, :search)
    end
end
