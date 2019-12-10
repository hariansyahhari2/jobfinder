class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :company
      t.string :status
      t.timestamps
    end
  end
end
