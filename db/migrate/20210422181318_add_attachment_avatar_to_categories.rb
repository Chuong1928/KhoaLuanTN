class AddAttachmentAvatarToCategories < ActiveRecord::Migration[5.2]
  def self.up
    change_table :categories do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :categories, :avatar
  end
end
