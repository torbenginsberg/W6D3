# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares, dependent: :destroy,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :shares,
        source: :viewer

    has_many :comments, dependent: :destroy,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment

    has_many :likes, as: :likeable


    validates :title, :image_url, :artist_id, presence:true
    validates :title, uniqueness: {scope: :artist_id, messsage: "Artist already has this title"}
end
