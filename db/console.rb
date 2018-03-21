require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({ 'name' => 'Rocky Rockstar' })
artist1.save()

artistr2 = Artist.new({ 'name' => 'Poppy Popstar' })
artist2.save()

album1 = Album.new({ 'artist_id' => artist1.id, 'title' => "Rocking All Rocking Day", 'release' => 1995 })
album1.save()

album2 = Album.new({ 'artist_id' => artist2.id, 'title' => 'Pop it Low' })
album2.save()

binding.pry
nil
