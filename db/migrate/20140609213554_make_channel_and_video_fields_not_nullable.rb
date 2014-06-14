class MakeChannelAndVideoFieldsNotNullable < ActiveRecord::Migration
  def change
  	change_column_null(:channels, :youtube_user, false)
  	change_column_null(:videos, :video_id, false)
  	change_column_null(:videos, :youtube_user, false)
  end
end
