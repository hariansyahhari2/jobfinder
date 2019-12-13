class JobUserController < ApplicationController
    def apply
        @job_user = JobsUser.create(user_id: current_user.id, job_id: params[:id])
    end
end