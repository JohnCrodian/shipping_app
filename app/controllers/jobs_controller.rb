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
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    @job.cont_present = 0
    @boats = Boat.all
    total_cont = 0
    (1..@boatsavail.length).each do |i|
     if (params["#{i}"]["id"] == "1")
       @boat = Boat.find(i)
       total_cont += @boat.capacity
       @job.boats.push(@boat)
     end
    end
    @job.cont_present = total_cont
    if @job.save
      redirect_to @job
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
    total_cont = @job.cont_present
    boatsall = Boat.all
    boatsjob = @job.boats
    @boatsavail = boatsall - boatsjob
    (0..@boatsavail.length-1).each do |i|
      #the id's in the boatsavail array does not line up the check box numbers
       boat = @boatsavail[i]
       j = boat.id
       if (params["#{j}"]["id"] == "1")
         @boat = Boat.find(j)
         total_cont += @boat.capacity
         @job.boats.push(@boat)
       end
    end
    @job.update(job_params)
    @job.update(cont_present: total_cont)
    # redirect_to "edit_job_path"
  end

  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "order deleted"
    redirect_to "profiles_show_path"
  end

  private

  def job_params
    params.require(:job).permit(:user_id, :jobname, :description, :origin, :destination, :cost, :cont_needed, :cont_present)
  end

  def set_job
     @job = Job.find(params[:id])
  end

end
