class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @boats = Boat.all
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user_id = current_user.id

    if @boat.save
      redirect_to @boat
      flash[:notice] = "Boat created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @boat.update(boat_params)
    redirect_to @boat
  end

  def destroy
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:user_id, :name, :capacity, :location)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end

end
