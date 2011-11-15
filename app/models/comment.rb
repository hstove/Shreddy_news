class Comment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user
  validates_presence_of :post_id, :user_id, :content
  validates_uniqueness_of :content, :scope => :post_id
end
