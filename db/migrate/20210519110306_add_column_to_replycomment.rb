class AddColumnToReplycomment < ActiveRecord::Migration[5.2]
  def change
    add_column :replycomments, :comment_id, :integer
  end
end
