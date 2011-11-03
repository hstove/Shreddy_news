class Dropposters < ActiveRecord::Migration
  def up
    drop_table :posters
    drop_table :users
  end

  def down
  end
end
