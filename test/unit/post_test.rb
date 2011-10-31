require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def new_post(url)
    Post.new(:title => "sick post",
             :url => url,
             :comments => nil)
  end
  
  test "post url check" do
    post = Post.new(:title    => "Sick post")
   
    bad = %w{ http://newschoolers.com youtube.com spicegirls.xxx http//vimeo.com
      vimeo.com/21324374 www.youtube.com/watch?v=j-xCALXBUAI&feature=aso}
      
    ok = %w{ http://www.youtube.com/watch?v=j-xCALXBUAI&feature=aso 
              http://vimeo.com/21324374 }
    
    bad.each do |b|
      assert new_post(b).invalid?, "#{b} shouldn't be valid"
    end
    
    ok.each do |b|
      assert new_post(b).invalid?, "#{b} shouldn't be invalid"
    end 
  end       

end
