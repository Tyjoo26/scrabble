gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_string
    scrabble = Scrabble.new
    assert_equal 8, scrabble.score("hello")
  end

  def test_it_can_score_a_different_string
    scrabble = Scrabble.new
    assert_equal 13, scrabble.score("sparkle")
  end

  def test_empty_string_is_zero
    scrabble = Scrabble.new

    assert_equal 0, scrabble.score("")
  end

  def test_nil_is_zero
    scrabble = Scrabble.new

    assert_equal 0, scrabble.score(nil)
  end

  def test_integer_returns_zero
    scrabble = Scrabble.new

    assert_equal 0, scrabble.score(55)
  end

  def test_score_with_multipliers
    scrabble = Scrabble.new
    actual = scrabble.score_with_multipliers('hello', [1,2,1,1,1])

    assert_equal 9, actual
  end

  def test_score_with_multiplers_and_double_score
    scrabble = Scrabble.new
    actual = scrabble.score_with_multipliers('hello', [1,2,1,1,1], 2)

    assert_equal 18, actual
  end

  def test_ten_point_score_bonus
    scrabble = Scrabble.new
    actual = scrabble.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)

    assert_equal 58, actual
  end


end
