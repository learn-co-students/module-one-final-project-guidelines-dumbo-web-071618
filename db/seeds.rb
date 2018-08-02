### ROCK ###
cb = Artist.create(name: "Courtney Barnette", song_id: 1)

song1 = Song.create(name: "City Looks Pretty", artist_id: 1, genre_id: 1, playlistsong_id: 1)

pls1 = Playlistsong.create(playlist_id: 1, song_id: 1)

rock = Genre.create(name: "rock", song_id: 1)

pl1 = Playlist.create(name: "jamz", user_id: 1, playlistsong_id: 1)



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
