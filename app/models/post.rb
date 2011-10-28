class Post < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :url
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
