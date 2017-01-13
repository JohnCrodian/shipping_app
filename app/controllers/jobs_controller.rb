class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
    @boats = Boat.all
  end

  def show
    @jobs = Job.all
    @boats = Boat.all
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    @job.cont_present = 0
    @total_cont = 0
    @boats = Boat.all
    add_boats_method
    @job.cont_present = @total_cont
    if @job.save
      redirect_to profiles_show_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    boatsall = Boat.all
    boatsjob = @job.boats
    @boatsavail = boatsall - boatsjob
  end

  def update
    @total_cont = @job.cont_present
    add_boats_method
    @job.update(job_params)
    @job.update(cont_present: @total_cont)
    # redirect_to "edit_job_path"
  end

  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "order deleted"
    redirect_to profiles_show_path
  end

  def add_boats_method
    boatsall = Boat.all
    boatsjob = @job.boats
    @boatsavail = boatsall - boatsjob
    (0..@boatsavail.length-1).each do |i|
      #the id's in the boatsavail array does not line up the check box numbers
       boat = @boatsavail[i]
       j = boat.id
       if (params["#{j}"]["id"] == "1")
         @boat = Boat.find(j)
         @total_cont += @boat.capacity
         @job.boats.push(@boat)
       end
    end
  end

  private

  def job_params
    params.require(:job).permit(:user_id, :jobname, :description, :origin, :destination, :cost, :cont_needed, :cont_present)
  end

  def set_job
     @job = Job.find(params[:id])
  end

end
