class JobUser < ActiveRecord::Base  
    validates :job_id, presence:true
    validates :user_id, presence:true
    belongs_to :jobs
    belongs_to :users
end