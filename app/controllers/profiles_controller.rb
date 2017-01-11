class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
  end

  def show
<<<<<<< HEAD
    @boats = Boat.all
=======
    # @user = User.find_by(params[:id])
    @user = current_user
    @boats = Boat.all
    @jobs = Job.all
>>>>>>> jobs
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
