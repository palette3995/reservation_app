class RoomsController < ApplicationController
before_action :authenticate_user!
  def index
    @rooms = Room.where(user_id: current_user.id).where.not(image: nil).order(updated_at: 'DESC')
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(rooms_params)
      flash[:notice] = "ルーム情報を更新しました"
      redirect_to action: "index"
    else
      render "edit"
    end
  end

  def destroy
    binding.pry
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ルーム情報を削除しました"
    redirect_to action: "index"
  end

  def search
    if params[:search_area].present?
      @rooms = Room.where('rooms.adress LIKE(?)',"%#{params[:search_area]}%")
      @search_result = "#{params[:search_area]}"
    elsif params[:search].present?
      @rooms = Room.where('rooms.room_name LIKE(?)',"%#{params[:search_area]}%")
      @search_result = "#{params[:search]}"
    end

  end

  private

  def rooms_params
    params.require(:room).permit(:user_id, :room_name, :room_introduction, :price, :adress, :image, )
  end

end
