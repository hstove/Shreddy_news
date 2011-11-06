class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :votes

      t.timestamps
    end
  end
  def down
    drop_table :votes
  end
end
