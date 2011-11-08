module ApplicationHelper
  
  def filters(text)
    vimeo_regex = /http:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/
    youtube_regex = /http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?|http:\/\/(www.)?youtu\.be\/([A-Za-z0-9._%-]*)?/
    ns_regex = /http:\/\/(www.)?newschoolers\.com\/watch\/([0-9]*)/
    if vimeo_regex.match(text)
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
    if youtube_regex.match(text)
      youtube_id = $2 || $5
      width = 440
      height = 282
      frameborder = 0
      @result = %{iframe class="youtube-player" type="text/html" width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{youtube_id}" frameborder="#{frameborder}"</iframe}
    end
    if ns_regex.match(text)
      ns_id = $2
      @result = %{iframe src="http://www.newschoolers.com/videoembed/#{ns_id}" width="440" height="275" frameborder="0" style="border: 0px; padding: 0xp; margin: 0px;"<\/iframe}
    end
    @result
  end
  
  def basic_url(text)
    vimeo_regex = /http:\/\/(www.)?(vimeo\.com)\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/
    youtube_regex = /http:\/\/(www.)?(youtube\.com)\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?|http:\/\/(www.)?youtu\.be\/([A-Za-z0-9._%-]*)?/
    ns_regex = /http:\/\/(www.)?(newschoolers\.com)\/watch\/([0-9]*)/
    regex = [vimeo_regex, youtube_regex, ns_regex]
    regex.each do |r|
      if r.match(text)
        @url = $2
      end
    end
    @url
end
end
        
