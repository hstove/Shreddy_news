class AdminController < ApplicationController
  http_basic_authenticate_with :name => "hank", :password => "admin"
  def index
    @posts = Post.all.sort { |a,b| -(a.score <=> b.score)}
    @admin = self 
  end

end