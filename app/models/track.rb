class Track < ActiveRecord::Base
  attr_accessible :title, :artist, :youtube_link, :download_link, :created_at, :user_id, :vote

  belongs_to :user
  has_many :votes

  validates_format_of :youtube_link, :with => /^http:\/\/(www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/

end
