class TopsController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @event = Event.new
  end

end
