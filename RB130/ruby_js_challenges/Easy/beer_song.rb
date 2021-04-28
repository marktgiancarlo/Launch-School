class BeerSong
  def self.verses(start, stop)
    i = start
    lyrics = []
    while i >= stop
      lyrics << case i
                when 0
                  "No more bottles of beer on the wall, no more bottles of beer.\n" \
                  "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
                when 1
                  "1 bottle of beer on the wall, 1 bottle of beer.\n" \
                  "Take it down and pass it around, no more bottles of beer on the wall.\n"
                when 2
                  "2 bottles of beer on the wall, 2 bottles of beer.\n" \
                  "Take one down and pass it around, 1 bottle of beer on the wall.\n"
                else
                  "#{i} bottles of beer on the wall, #{i} bottles of beer.\n" \
                  "Take one down and pass it around, #{i - 1} bottles of beer on the wall.\n"
                end
      i -= 1
    end
    lyrics.join("\n")
  end

  def self.verse(start)
    BeerSong.verses(start, start)
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end
end
