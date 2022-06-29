class EditArtworksIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :artworks, :title
    add_index :artworks, :artist_id 
  end
end
