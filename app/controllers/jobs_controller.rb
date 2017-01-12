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
    (1..@boats.length).each do |i|
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
  end

  def update
    @job.update(job_params)
    redirect_to @job
  end

  def destroy
  end

  private

  def job_params
    params.require(:job).permit(:user_id, :jobname, :description, :origin, :destination, :cost, :cont_needed)
  end

  def set_job
     @job = Job.find(params[:id])
  end

end
