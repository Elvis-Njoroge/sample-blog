class AddBlogsCounterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :blogs_counter, :integer, default: 0
  end
end
