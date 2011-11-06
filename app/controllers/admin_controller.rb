class AdminController < ApplicationController
  
  def index
    @posts = Post.all.sort { |a,b| -(a.score <=> b.score)}
    @admin = self 
  end
  

end