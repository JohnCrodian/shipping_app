class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def index
    # @user = User.all
  end

  def new
  end

  def show
    # @user = User.find_by(params[:id])
    @user = current_user
    @boats = Boat.all
    @jobs = Job.all
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
