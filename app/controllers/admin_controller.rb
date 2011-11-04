class AdminController < ApplicationController
  before_filter :ensure_admin
  
  def index
    @posts = Post.all.sort { |a,b| -(a.score <=> b.score)}
    @admin = self 
  end
  
  def ensure_admin?
    if current_user.username == 'heynk'
      true
    end
  end

end