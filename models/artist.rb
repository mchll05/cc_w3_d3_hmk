require('pg')
require_relative('album.rb')

class Artist

  attr_reader :name

    def initialize( options )
      @id = options['id'].to_i
      @name = options['name']
    end

def self.all
