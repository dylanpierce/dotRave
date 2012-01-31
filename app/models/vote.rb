class Vote < ActiveRecord::Base
  attr_accessible :count, :track_id, :user_id

  #validates_uniqueness_of :user_id, :message => "You have already voted on this track."

  belongs_to :track
  belongs_to :user


end
