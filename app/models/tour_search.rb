class TourSearch
  attr_reader :date_from, :date_to, :tour_name, :price_from, :price_to, :location, :seats

  def initialize(params)
    params ||= {}
    @tour_name = params[:tour_name]
    @date_from = params[:date_from]
    @date_to = params[:date_to]
    @price_from = params[:price_from]
    @price_to = params[:price_to]
    @location = params[:location]
    @seats = params[:seats]
  end

  def scope
    tours = Tour.where('name LIKE ? ', "%#{@tour_name}%") if @tour_name.present?
    tours = Tour.where("start_location LIKE ? OR country LIKE? OR state LIKE ?", "%#{@location}%", "%#{@location}%", "%#{@location}%") if @location.present?

    if @price_from.present? && @price_to.present?
      tours = Tour.where("? <= price <= ?", @price_from, @price_to)
    elsif @price_from.present? && !@price_to.present?
      tours = Tour.where("price >= ?", @price_from)
    elsif !@price_from.present? && @price_to.present?
      tours = Tour.where("price <= ?", @price_to)
    end

    if @date_from.present? && @date_to.present?
      tours = Tour.where("? <= start_date AND end_date <= ?", @date_from, @date_to)
    elsif @date_from.present? && !@date_to.present?
      tours = Tour.where("? <= start_date", @date_from)
    elsif !@date_from.present? && @date_to.present?
      tours = Tour.where("end_date <= ?", @date_to)
    end

    if @seats.present?
      ids = []
      Tour.all.each do |t|
        ids.append t.id if t.available_seats >= @seats.to_i
      end
      tours = Tour.where(id: ids)
    end
    tours
  end


  private
    def parsed_date(date_string, default)
      Date.parse(date_string)
    rescue ArgumentError, TypeError
      default
    end

end
