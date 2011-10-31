module ApplicationHelper
  
  def filters(text)
    text.gsub(/http:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
       vimeo_id = $2
       width = '440'
       height = '248'
       show_title = "title=0"
       show_byline = "byline=0" 
       show_portrait = "portrait=0"
       frameborder = false || 0
       query_string_variables = [show_title, show_byline, show_portrait].compact.join("&")
       query_string = "?" + query_string_variables unless query_string_variables.empty?

       @result = %{iframe src="http://player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" frameborder="#{frameborder}"</iframe}
    end
    text.gsub(/http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?|http:\/\/(www.)?youtu\.be\/([A-Za-z0-9._%-]*)?/) do
      youtube_id = $2 || $5
      width = 390
      height = 250
      frameborder = 0
      @result = %{iframe class="youtube-player" type="text/html" width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{youtube_id}" frameborder="#{frameborder}"
  </iframe}
    end
    @result
  end
  
  def is_video(id)
    url = Post.find(id)
    if url.url =~ /http:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/
      @safe = true
    elsif url.url =~ /http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?|http:\/\/(www.)?youtu\.be\/([A-Za-z0-9._%-]*)?/
      @safe = true
    else
      @safe = false
    end
    if @safe == true; video = "video"
    end
    video
  end
  
  
  
  
  def vimeo(text)
     text.gsub(/http:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
       vimeo_id = $2
       width = '440'
       height = '248'
       show_title = "title=0"
       show_byline = "byline=0" 
       show_portrait = "portrait=0"
       frameborder = false || 0
       query_string_variables = [show_title, show_byline, show_portrait].compact.join("&")
       query_string = "?" + query_string_variables unless query_string_variables.empty?

       %{<iframe src="http://player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" frameborder="#{frameborder}"></iframe>}
     end
   end
   
   def youtube(text)
     regex = /http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?|http:\/\/(www.)?youtu\.be\/([A-Za-z0-9._%-]*)?/
       text.gsub(regex) do
         youtube_id = $2 || $5
         width = 390
         height = 250
         frameborder = 0
         %{iframe class="youtube-player" type="text/html" width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{youtube_id}" frameborder="#{frameborder}"
     </iframe}
       end
     end
end
