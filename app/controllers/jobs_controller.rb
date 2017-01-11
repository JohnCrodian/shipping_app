class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id

    if @job.save #Ask Mia to explain what this is doing
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
    params.require(:job).permit(:user_id, :description, :origin, :destination, :cost, :cont_needed)
  end

  def set_job
     @job = Job.find(params[:id])
  end

end
