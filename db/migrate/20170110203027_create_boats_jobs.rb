class CreateBoatsJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :boats_jobs do |t|
      t.references :job, foreign_key: true
      t.references :boat, foreign_key: true
    end
  end
end
