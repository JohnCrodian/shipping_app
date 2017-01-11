class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
  end

  def show
    @boats = Boat.all
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
