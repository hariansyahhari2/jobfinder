class Job < ActiveRecord::Base
    validates :job_title, presence:true, length:{minimum:5}
    validates :company, presence:true, length:{minimum:5}
    validates :status, presence:true

end
