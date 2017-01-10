class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.text :description
      t.string :origin
      t.string :destination
      t.float :cost
      t.integer :cont_needed

      t.timestamps
    end
  end
end
