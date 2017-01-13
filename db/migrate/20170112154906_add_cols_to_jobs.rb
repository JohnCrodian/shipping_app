class AddColsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :jobname, :string
    add_column :jobs, :cont_present, :integer
  end
end
