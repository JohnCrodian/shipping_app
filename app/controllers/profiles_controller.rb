class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
  end

  def show
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
