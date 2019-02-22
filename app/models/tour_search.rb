class TourSearch
	attr_reader :date_from, :date_to, :tour_name, :price_from, :price_to, :location

	def initialize(params)
    	params ||={}
    	@tour_name = params[:tour_name]
    	@date_from = params[:date_from]
   		@date_to = params[:date_to]
   		@price_from = params[:price_from]
   		@price_to = params[:price_to]
   		@location = params[:location]
  	end

  	def scope
		if @tour_name
			Tour.where('name LIKE ?', @tour_name)
		else
			if @date_from && @date_to
				Tour.where("start_date BETWEEN ? AND ?", @date_from , @date_to)
			else
				if @price_from && @price_to
					Tour.where("price BETWEEN ? AND ?", @price_from , @price_to)
				else
					if @location
						Tour.where("start_location LIKE ? OR country LIKE? OR state LIKE ?", @location, @location, @location)
					else
						Tour.all
					end
				end
			end
		end
	end


  	private

  	def parsed_date(date_string, default)
    	Date.parse(date_string)
  	rescue ArgumentError, TypeError
    	default
  	end

end
