class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.all
	end

    def new
		@reservation = Reservation.new
	end

    def confirm
		@reservation = Reservation.new(confirmation_params)
	end

    def create
        @reservation = current_user.reservations.new(reservation_params)
        if @reservation.save
            redirect_to root_path, notice: "ルームを予約しました"
        else
            render "index", notice: "ルームの予約に失敗しました"
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
