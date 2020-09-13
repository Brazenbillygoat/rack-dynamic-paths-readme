require_relative './song.rb'

class Application

  @@songs = [Song.new("Sorry", "Justin Bieber"),
    Song.new("Hello","Adele")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # @@songs.each do |song|
    #   resp.write "#{song.title}\n"
    # end

    if req.path.match(/songs/)

      song_title = req.path.split("/songs/").last

      song = @@songs.find{ |song| song.title == song_title }

      resp.write song.artist

    end

    resp.finish
  end

end