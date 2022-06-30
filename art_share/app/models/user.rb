# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :artworks, dependent: :destroy,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :views, dependent: :destroy,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks, 
        through: :views,
        source: :artwork
    
    validates :username, presence:true, uniqueness: true

end
