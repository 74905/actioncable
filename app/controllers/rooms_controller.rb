class RoomsController < ApplicationController

  def index
  @rooms = Room.all
  @room = Room.new
  end

  def create
    room = Room.new(room_params)
    room.save
    redirect_to rooms_path
  end
  
  def show
   @room = Room.find(params[:id])
   @chats = @room.chats
  end

private
  def room_params
    params.require(:room).permit(:name)
  end

end
