class JobsController < ApplicationController
    before_action :check_current_user, only:[:new, :index, :create, :edit, :update, :destroy]
    
    def index
        @jobs = Job.all.order("created_at DESC")
    end

    def new
        @job = Job.new
    end

    def show
        @job = Job.find_by_id(params[:id])
    end

    def edit
        @job = Job.find_by_id(params[:id])
    end

    def update
        @job = Job.find_by_id(params[:id])
        if @job.update(params_job)
            flash[:success] = "Success Update Job"
            redirect_to action: 'index'
        else
            flash[:error] ="data not valid"
            render 'edit'
        end
    end

    def destroy
        @job = Job.find_by_id(params[:id])
        if @job.destroy
            flash[:success] = "Success Delete Job"
            redirect_to action: "index"
        else
            flash[:success] = "Success Delete Records"
            redirect_to action: "index"
        end
    end

    def create
        @job = Job.new(params_job)
        if @job.save
            flash[:success] = "Success Add Job"
            redirect_to action: 'index'
        else
            flash[:error] = "Data not valid"
            render 'new'
        end
    end

    private
    def params_job
        params.require(:job).permit(:job_title, :job_title, :company, :status)
    end
end
