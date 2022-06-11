class ReservationsController < ApplicationController
    def confirm
        @reservation = Reservation.new
    end

    def create

        event = Event.find(params[:event_id])
        @reservation = current_user.reservations.build(reservation_params)
        @reservation.event = event

        if @reservation.save
            redirect_to root_path, notice: "ルームを予約しました"
        else
            render "index", notice: "ルームの予約に失敗しました"
        end
    end

    private
      def reservation_params
        params.require(:reservation).permit(:started_at, :ended_at, :people_number)
      end
end
