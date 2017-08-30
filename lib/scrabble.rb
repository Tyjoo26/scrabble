class Scrabble

  attr_reader

  def initialize
    @key = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end


  def score(word)
    if word == nil
      return 0
    elsif word.is_a? Integer
      return 0
    else
      data = word.upcase.split("")
      score_conversion_string(data)
    end
  end

  def score_conversion_string(data)
    if data == []
      return 0
    else
      data.map do |letter|
        @key[letter]
      end.inject(:+)
    end
  end


  def convert_letters_to_array(data)
    data.map do |letter|
      @key[letter]
    end
  end


  def score_with_multipliers(data, multipliers, double = 1)
    data = data.upcase.split("")
    if data.count >= 7
      new_array = convert_letters_to_array(data)
      new_array.zip(multipliers).map do |x,y|
        x * y
      end.inject(:+) + 10 * double
    else
      new_array = convert_letters_to_array(data)
      new_array.zip(multipliers).map do |x,y|
        x * y
      end.inject(:+) * double
    end
  end





end

#First goal is to figure out a way to assign points based on the word being given to the progam. We'll need to define a method to connect each letter of a string to its assigned value in the method hash def point_values

#Second goal is to define a method to add up the individual scores of letters into a total points

##there is a distinction between letter and words. Each is an argument in itself.

#define a score_with_multipliers method that can take multiple arguments. The first argument is the string, the second argument is the multiplier of score based on array, an optional third argument is passed as an optional final score multiplier

#   Note: a double letter score in Scrabble is dependent on the position of a letter on the board. The arrays passed to `#score_with_multipliers` indicate the multiplier for a letter in the corresponding position of the word that is passed as the first argument.
# ```
# > game = Scrabble.new
# => ...
# > game.score("hello")
# => 8
# > game.score("")
# => 0
# > game.score(nil)
# => 0
# > game.score_with_multipliers('hello', [1,2,1,1,1])
# => 9
# > game.score_with_multipliers('hello', [1,2,1,1,1], 2)
# => 18
# > game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
# => 58
# ```
# Use the existing `point_values` method in the `Scrabble` class as a source for each letter's value.
