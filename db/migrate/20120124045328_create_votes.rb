class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count
      t.integer :user_id
      t.integer :track_id

      t.timestamps
    end
  end
end
