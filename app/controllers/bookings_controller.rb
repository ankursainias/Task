class BookingsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	DEFAULT_DISTANCE = 5
	def new
		@booking = Booking.new
	end

	def create
		@booking = current_user.bookings.new
		seat_request = params[:booking][:no_of_passenger]
		@drivers = Driver.where("free_seats >= ? AND active = ?",seat_request, true)
			@message = 	find_driver_near_me
			flash[:notice] = @message
		redirect_to bookings_path	
	end

	def show
		
	end

	def start
		
	end

	def started
		@booking = Booking.find_by(id: params[:booking][:id])
		if @booking.nil?
			flash[:alert] = "Booking not found"
		elsif @booking.booking_status.default_name == "accepted"
			st_id = BookingStatus.find_by(default_name: 'started').id
			@booking.update(booking_status_id: st_id)
			flash[:notice] = "Booking started"
		else
			flash[:alert] = "Invalid booking"
		end
		redirect_to bookings_path
	end

	def mark_complete
		
	end


	def completed
		@booking = Booking.find_by(id: params[:booking][:id])
		if @booking.nil?
			flash[:alert] = "Booking not found"
		elsif @booking.booking_status.default_name == "started"
		st_id = BookingStatus.find_by(default_name: 'completed').id
		@booking.update(booking_status_id: st_id)
		driver = @booking.driver
		driver.update(:free_seats=> driver.free_seats+@booking.no_of_passenger)
		flash[:notice] = "Booking completed"
	else
		flash[:alert] = "Invalid booking"
		end
		redirect_to bookings_path
	end

	def find_driver_near_me
		start_lat_lng = [30.7185, 76.7144]
		end_lat_lng = [30.7184, 76.7145]
		driver  =	@drivers.near(start_lat_lng,DEFAULT_DISTANCE).sample
		if driver.present?
			booking_initialize(driver)
			message = "booking successfuly created"
		else
			message = "No driver near you"
		end
	end


	def booking_initialize(driver)
			@booking.driver_id = driver.id
			@booking.vehicle_id = driver.active_vehicle.try(:id)
			@booking.booking_status_id = BookingStatus.find_by(default_name: 'accepted').id
			@booking.no_of_passenger = params[:booking][:no_of_passenger]
			@booking.pickup_location = params[:booking][:start_address]
			@booking.lat = 30.7185
			@booking.lng = 76.7144
			@booking.build_drop_location(address: params[:booking][:end_address],lat: 30.7184, lng: 76.7145)
			@booking.save!
			driver.free_seats -= @booking.no_of_passenger
			driver.save!
	end

	

	private



end