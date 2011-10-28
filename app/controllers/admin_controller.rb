class AdminController < ApplicationController
  http_basic_authenticate_with :name => "hank", :password => "admin"
  def index
    @posts = Post.all
    @admin = self 
  end

end