class AddCommentsCounterToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :comments_counter, :integer, default: 0
  end
end
