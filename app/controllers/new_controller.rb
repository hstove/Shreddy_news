class NewController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 25).order("created_at desc").all
    @title = "New Posts"
    if params[:post]
      @post = Post.find(params[:post])
    else
      @post = @posts.first
    end
  end

end
