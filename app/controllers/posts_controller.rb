class PostsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 25).all.sort { |a,b| -(a.score <=> b.score) }
    @user = current_user
    @title = "Top New Action Sports Videos"
    if params[:post]
      @post = Post.find(params[:post])
    else
      @post = @posts.first
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.js
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.new
    @user = current_user
    @title = @post.title

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  # GET /posts/new
  # GET /posts/new.json
  def new
    @user = User.find(params[:user_id])
    @post = Post.new(:user_id => @user.id)
    @title = "New Post"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @title = "Edit Post"
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = current_user
    @post = @user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to :action => 'index', notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to :action => 'index', notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index', :controller => 'admin' }
      format.json { head :ok }
    end
  end
  
  #def upvote
   # post = Post.find(params[:id])
    #if post.votes?
    #  post.votes += 1
   # else post.votes.nil?
    #  post.votes = 1
   # end
  #  post.save
   # redirect_to :action => 'index'
  #end
  
  def vote
    #params[:answer_id][:vote]
    #it can be "1" or "-1"
    @post = Post.find(params[:post_id])
    @post.vote!(params[:post_id][:votes])
    redirect_to :action => 'index'
  end
  
  def upvote
    @post = Post.find(params[:post_id])
    @user = current_user
    @votes = Vote.find_or_create_by_post_id_and_user_id(@post.id, @user.id)
    @post_creator = User.find(@post.user_id)
    if @post_creator.karma?
      @post_creator.karma +=1
    else
      @post_creator.karma = 1
    end
    respond_to do |format|
    #  format.html { redirect_to posts_path }
      format.js
    end
  end
  
  def switch_vid
    @post = Post.find(params[:post])
    respond_to do |format|
      format.js
    end
  end
    
  
end
