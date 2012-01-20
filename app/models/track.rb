class Track < ActiveRecord::Base
  attr_accessible :title, :artist, :youtube_link, :download_link, :created_at, :user_id

  belongs_to :user

end
