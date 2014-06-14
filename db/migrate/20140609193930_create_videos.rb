class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_id
      t.references :channel, index: true
      t.string :title
      t.text :description
      t.string :url
      t.string :youtube_user
      t.timestamp :uploaded_at

      t.timestamps
    end
    add_index :videos, :video_id, unique: true
  end
end
