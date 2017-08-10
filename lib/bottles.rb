class Bottles
  def verse(n)
    now = Quantity.new(n)
    theNext = Quantity.new(n - 1)
    phrase = n == 0 ?
               zeroPhrase :
               "Take #{n == 1 ? 'it' : 'one'} down and pass it around, #{theNext}"
    <<-VERSE
#{now.to_s.capitalize} of beer on the wall, #{now} of beer.
#{phrase} of beer on the wall.
VERSE
  end

  def zeroPhrase
    "Go to the store and buy some more, #{Quantity.new(99)}"
  end

  def verses(x, y)
    (y..x).map { |i| verse i }
      .reverse.join("\n")
  end

  def song
    verses(99, 0)
  end

  class Quantity
    def initialize(n)
      @quantity = n == 0 ? 'no more' : n.to_s
      @ending = n == 1 ? '' : 's'
    end

    def to_s
      "#{@quantity} bottle#{@ending}"
    end
  end

end
