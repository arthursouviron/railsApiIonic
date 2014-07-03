class AddAttachmentAvatarToContacts < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :contacts, :avatar
  end
end
