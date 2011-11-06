class RemoveColumnFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :votes
  end

  def down
  end
end
