require_relative('../db/sql_runner')
require('pg')
require_relative('artist.rb')

class Album

  attr_reader :id, :title, :release, :artist_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @release = options['release'].to_i
  @artist_id = options['artist_id'].to_i
end

def artist()
sql = "SELECT * FROM artists
WHERE id = $1"
values = [@artist_id]
results = SqlRunner.run( sql, values )
artist_data = results[0]
artist = Artist.new( artist_data )
return artist
end

def save()
    sql = "INSERT INTO albums(title, release, artist_id)
    VALUES($1, $2, $3)
    RETURNING id"
    values = [@title, @release, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results("save", values)[0]["id"].to_i
  end

  def update()
    sql = "
    UPDATE pizza_orders SET (title, release)
    VALUES($1, $2)
    RETURNING *
    WHERE id = $1"
    values = [@title, @release, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
      sql = "DELETE FROM albums
      where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.find(id)
      sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
  end

end
