require('pg')
require_relative('artist.rb')

class Album

  attr_reader :title, :release

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @release = options['release'].to_i
  @artist_id = options['artist_id'].to_i
end
