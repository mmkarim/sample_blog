class AddDeletedAtToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :deleted_at, :datetime
    add_index :posts, :deleted_at
  end
end