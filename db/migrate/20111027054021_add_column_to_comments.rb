class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :fixnum
  end
end
