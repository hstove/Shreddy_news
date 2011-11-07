class NewController < ApplicationController
  def index
    @posts = Post.order("created_at").all
    @title = "New Posts"
  end

end
