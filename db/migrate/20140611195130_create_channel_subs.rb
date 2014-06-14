class CreateChannelSubs < ActiveRecord::Migration
  def change
    create_table :channel_subs do |t|
      t.references :channel, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
