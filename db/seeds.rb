User.destroy_all
Artist.destroy_all
Song.destroy_all
Playlistsong.destroy_all
Genre.destroy_all
Playlist.destroy_all

### ROCK ###
coder38 = User.create(name: "coder38")
courtney_barnette = Artist.create(name: "Courtney Barnette")
rock = Genre.create(name: "rock")
jamz = Playlist.create(name: "jamz", user: coder38)
city_looks_pretty = Song.create(name: "City Looks Pretty", artist: courtney_barnette, genre: rock)
Playlistsong.create(playlist: jamz, song: city_looks_pretty)

not_your_mother = Song.create(name: "I'm Not Your Mother", artist: courtney_barnette, genre: rock)
Playlistsong.create(playlist: jamz, song: not_your_mother)

pedestrian = Song.create(name: "Pedestrian at Best", artist: courtney_barnette, genre: rock)
Playlistsong.create(playlist: jamz, song: pedestrian)

joey_vantes = Artist.create(name: "Joey Vantes")
rap = Genre.create(name: "rap")
six_four = Song.create(name: "64", artist: joey_vantes, genre: rap)
playlistsong1 = Playlistsong.create(playlist: jamz, song: six_four)

bad = Song.create(name: "Bad", artist: joey_vantes, genre: rap)
Playlistsong.create(playlist: jamz, song: bad)

tonight = Song.create(name: "Tonight", artist: joey_vantes, genre: rap)
Playlistsong.create(playlist: jamz, song: tonight)
# Song.create(name: "I'm Not Your Mother", artist_id: 1, genre_id: 1, playlistsong_id: 2)
# Playlistsong.create(playlist_id: 1, song_id: 2)
#
# Song.create(name: "Pedestrian at Best", artist_id: 1, genre_id: 2)
#
# Artist.create(name: "Joey Vantes")
# Song.create(name: "64", artist_id: 2, genre_id: 2, playlistsong_id: 3)
# Genre.create(name: "rap")
# Playlistsong.create(playlist_id: 1, song_id: 4)
#
# Song.create(name: "Bad", artist_id: 2, genre_id: 2, playlistsong_id: 4)
# Playlistsong.create(playlist_id: 1, song_id: 5)


# Song.create(name: "I'm Not Your Mother",
#   artist: "Courtney Barnette",
#   genre: "Rock")
#
# Song.create(name: "Pedestrian At Best",
#   artist: "Courtney Barnette",
#   genre: "Rock")
#
# Song.create(name: "Fire",
#   artist: "Jimi Hendrix",
#   genre: "Rock")
#
# Song.create(name: "Little Wing",
#   artist: "Jimi Hendrix",
#   genre: "Rock")
#
# Song.create(name: "Voodoo Child",
#   artist: "Jimi Hendrix",
#   genre: "Rock")
#
# ### RAP ###
# Song.create(name: "RUTS",
#   artist: "Andy Mineo",
#   genre: "Rap")
#
# Song.create(name: "Kidz",
#   artist: "Andy Mineo",
#   genre: "Rap")
#
# Song.create(name: "Dunk Contest",
#   artist: "Andy Mineo",
#   genre: "Rap")
#
# Song.create(name: "Fettuccine",
#   artist: "1K Phew",
#   genre: "Rap")
#
# Song.create(name: "Back Then",
#   artist: "1K Phew",
#   genre: "Rap")
#
# Song.create(name: "Load of Me",
#   artist: "1K Phew",
#   genre: "Rap")
#
# ### COUNTRY ###
# Song.create(name: "Pray for the Fish",
#   artist: "Randy Travis",
#   genre: "Country")
#
# Song.create(name: "Keep Your Lure in the Water",
#   artist: "Randy Travis",
#   genre: "Country")
#
# Song.create(name: "Rise and Shine",
#   artist: "Randy Travis",
#   genre: "Country")
#
# Song.create(name: "40 Days",
#   artist: "Third Day",
#   genre: "Country")
#
# Song.create(name: "It's Alright",
#   artist: "Third Day",
#   genre: "Country")
#
# Song.create(name: "Still Listening",
#   artist: "Third Day",
#   genre: "Country")
#
# ### JAZZ ###
# Song.create(name: "Catch",
#   artist: "Pat Martino",
#   genre: "Jazz")
#
# Song.create(name: "Interchange",
#   artist: "Pat Martino",
#   genre: "Jazz")
#
# Song.create(name: "Blue in Green",
#   artist: "Pat Martino",
#   genre: "Jazz")
#
# Song.create(name: "Agua de Beber",
#   artist: "Astrud Gilberto",
#   genre: "Jazz")
#
# Song.create(name: "Dindi",
#   artist: "Astrud Gilberto",
#   genre: "Jazz")
#
# Song.create(name: "Once I Loved",
#   artist: "Astrud Gilberto",
#   genre: "Jazz")
#
# ### SOUL ###
# Song.create(name: "Five Dolla Mic",
#   artist: "Dwele",
#   genre: "Soul")
#
# Song.create(name: "Blow Your Mind",
#   artist: "Dwele",
#   genre: "Soul")
#
# Song.create(name: "Love Ultra",
#   artist: "Dwele",
#   genre: "Soul")
#
# Song.create(name: "Ephemeral",
#   artist: "Tom Misch",
#   genre: "Soul")
#
# Song.create(name: "When You Want to Love",
#   artist: "Tom Misch",
#   genre: "Soul")
#
# Song.create(name: "Everybody Get Down",
#   artist: "Tom Misch",
#   genre: "Soul")
