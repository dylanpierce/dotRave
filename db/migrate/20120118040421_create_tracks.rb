class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :youtube_link
      t.string :download_link
      t.datetime :created_at
      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
