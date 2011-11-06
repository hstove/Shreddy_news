module PostsHelper
  def votes_for(post)
    @votes = Vote.where(:post_id => post.id).all
    num = @votes.length
  end
end
