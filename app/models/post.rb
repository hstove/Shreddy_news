class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates_presence_of :url, :title, :user_id
  validate :is_video?
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_uniqueness_of :url, :message => "This has already been submitted. No reposts!"
  
  def score
    if self.votes.nil?
      self.votes = 0
    end
    score = (self.votes + 1) / ((((Time.now - self.created_at) / 1.hour ) + 2)**1.5)
    (score * 100).round
  end
  
  def is_video?
    url = self
    vimeo_regex = /http:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/
    youtube_regex = /http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?|http:\/\/(www.)?youtu\.be\/([A-Za-z0-9._%-]*)?/
    ns_regex = /http:\/\/(www.)?newschoolers\.com\/watch\/([0-9]*)/
    unless url.url =~ vimeo_regex || youtube_regex || ns_regex
      errors.add(:url, "- Shreddy News only accepts links from Vimeo and Youtube right now")
    end
  end
end
