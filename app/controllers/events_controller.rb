class EventsController < ApplicationController
  before_action :search

  def search

    if params[:address].present?
      @events = Event.where('address LIKE ?', "%#{params[:address]}%")
    elsif params[:keyword].present?
      @events = Event.where('room_name LIKE ? OR price LIKE ? OR content LIKE ? OR address LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    else
      @events = Event.none
    end
  end

  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "新しいルームを登録をしました"
      redirect_to root_path
    else
      flash[:notice] = "入力項目に誤りがあります"
      render "new"
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def event_params
    params.require(:event).permit(:room_name, :content, :price, :address, :image, :id, :user_id)
  end

end
