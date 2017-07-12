gem 'minitest'
require_relative '../lib/word_list'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordListTest < Minitest::Test


  def test_map_letters_to_one
    wordlist = WordList.new



    assert_equal {"A", "E": 1}


  end
end
