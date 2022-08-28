class RemoveCommentFromViews < ActiveRecord::Migration[7.0]
  def change
    remove_column :views, :comment
  end
end
