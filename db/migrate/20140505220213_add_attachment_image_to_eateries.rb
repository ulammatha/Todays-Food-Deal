class AddAttachmentImageToEateries < ActiveRecord::Migration
  def self.up
    change_table :eateries do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :eateries, :image
  end
end
