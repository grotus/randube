class RemoveYoutubeUserFromVideo < ActiveRecord::Migration
  def up
    remove_column :videos, :youtube_user
  end

  def down
    add_column :videos, :youtube_user, :string, unique: true
  end
end
