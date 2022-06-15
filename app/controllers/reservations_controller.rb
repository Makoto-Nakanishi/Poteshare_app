class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.all
	end

    def new
		@reservation = Reservation.new
	end

  def confirm
		@reservation = Reservation.new(confirmation_params)

    @start_date = confirmation_params[:started_at]
    @end_date = confirmation_params[:ended_at]
    @people_number = confirmation_params[:people_number]
    @price = confirmation_params[:price]
 
    @start_date = @start_date.to_date
    @end_date = @end_date.to_date
    @days = (@end_date - @start_date).to_i

    @people_number = @people_number.to_i
    @price = @price.to_i

    @total = @days * @people_number * @price

    binding.pry
	end

    def create
        @reservation = current_user.reservations.new(reservation_params)
        if @reservation.save
            redirect_to root_path, alert: "ルームを予約しました"
        else
            render "index", alert: "ルームの予約に失敗しました"
        end
    end

    private

      def confirmation_params
        params.permit(:started_at, :ended_at, :people_number, :price, :user_id, :event_id)
      end

      def reservation_params
        params.require(:reservation).permit(:started_at, :ended_at, :people_number, :price, :user_id, :event_id)
      end
end
