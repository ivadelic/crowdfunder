class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :category
      t.string :tags
      t.integer :goal_amount
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
