class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :youtube_user
      t.string :url
      t.string :title
      t.text :description
      t.timestamp :last_updated

      t.timestamps
    end
    add_index :channels, :youtube_user, unique: true
  end
end
