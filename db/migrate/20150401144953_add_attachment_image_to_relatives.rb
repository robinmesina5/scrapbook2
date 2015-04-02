class AddAttachmentImageToRelatives < ActiveRecord::Migration
  def self.up
    change_table :relatives do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :relatives, :image
  end
end
