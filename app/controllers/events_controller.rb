class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "新しいルームの投稿をしました"
      redirect_to root_path
    else
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

  def search
    @events = Event.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

private

  def event_params
    params.require(:event).permit(:room_name, :content, :price, :address, :image, :id, :user_id)
  end

end
