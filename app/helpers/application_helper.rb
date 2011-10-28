module ApplicationHelper
  
  def hoster(text)
    uri = Addressable::URI.parse(text) 
    p uri.host
  end
  
  def dude
    return 'ya'
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
end
