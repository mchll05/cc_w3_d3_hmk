require_relative('../db/sql_runner')
require('pg')
require_relative('album.rb')

class Artist

  attr_reader :id, :name

    def initialize( options )
      @id = options['id'].to_i
      @name = options['name']
    end

    def albums()
        sql = "SELECT * FROM albums
        WHERE artist_id = $1"
        values = [@id]
        results = SqlRunner.run( sql, values )
        albums = results.map { |album| Album.new( album ) }
        return albums
      end

    def save()
      sql = "INSERT INTO artists(name)
      VALUES ($1)
      RETURNING id"
      values = [@name]
      results = SqlRunner.run(sql, values)
      @id = results[0]['id'].to_i
    end

    def update()
      sql = "
      UPDATE pizza_orders SET (name)
      VALUES($1)
      RETURNING *
      WHERE id = $1"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM artists
        where id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
      end

      def self.find(id)
        sql = "SELECT * FROM artists WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)

end
