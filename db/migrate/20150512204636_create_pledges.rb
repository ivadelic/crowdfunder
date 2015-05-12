class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.integer :project_id
      t.integer :reward_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
