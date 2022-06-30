class EditLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :liker_id, :integer
    add_index :likes, :liker_id
  end

end
