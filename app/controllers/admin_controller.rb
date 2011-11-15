class AdminController < ApplicationController
  #before_filter :ensure_admin
  
  def index
    @posts = Post.all.sort { |a,b| -(a.score <=> b.score)}
    @admin = self 
  end
  
  def ensure_admin
    @user = current_user
    unless @user.username == 'heynk'
      redirect_to posts_path, :notice => 'You are not an admin!'
    end
  end
  

end