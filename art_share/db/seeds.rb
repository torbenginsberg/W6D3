# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([{ username: 'Van Gogh'}, { username: 'Monet'}, { username: 'Manet'}])
artworks = Artwork.create([{title: "The Balcony", image_url: "www.thebalcony.com", artist_id: 10}])

artwork1 = Artwork.create(title: "Spring", image_url: "www.spring.com", artist_id: 1)
artwork2 = Artwork.create(title: "The Beach", image_url: "www.thebeach.com", artist_id: 6)
artwork3 = Artwork.create(title: "Madonna", image_url: "www.madonna.com", artist_id: 7)

share2 = ArtworkShare.create(artwork_id: 3, viewer_id: 7)
share4 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: 1)
share5 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: 6)

comment1 = Comment.create(artwork_id: 1, commenter_id: 1, body: "is she smiling?")
comment2 = Comment.create(artwork_id: 2, commenter_id: 2, body: "is it sunrise or sunset?")





