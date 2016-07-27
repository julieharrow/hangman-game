require_relative 'player'
require_relative 'hangman'

class Game

  attr_accessor :player1, :player2, :word, :blanks

  def initialize(player1, player2, word, blanks=[])
    @player1, @player2, @word, @blanks = player1, player2, word, blanks
    @hangman = Hangman.new(["right leg","left leg","left arm","right arm", "torso", "head"],[])
  end

  def display_blanks
    if @blanks == []
      50.times do
        puts "Clear the screen!"
      end
      @word.length.times do
        @blanks.push("")
      end
    end
    puts
    print @blanks
    puts
  end

  def word_is_guessed?
    @blanks == @word.split("") ? true : false
  end

  def check_if_letter_in_word(guess)
    success = false
    @word.split("").each_with_index do |letter,index|
      if guess == letter
        @blanks[index] = guess
        success = true
      end
    end
    if success == false
      @hangman.add_body_part_until_hanged()
      @hangman.show_hangman()
    else
      display_blanks()
    end
  end

  def end_game?
    if word_is_guessed?()
      puts "Game Over - you guessed it!"
    elsif @hangman.is_man_hanged?()
      puts "Game Over - you killed the man..."
    else
      return "no"
    end
  end

end

puts "Who has a word?"
player1 = Player.new(gets.chomp.capitalize)
puts "Great! #{player1.name}, you take the lead. And who else is playing?"
player2 = Player.new(gets.chomp.capitalize)
puts "That makes #{player2.name} the guesser!"
puts "#{player1.name}, what is your word?...No peeking #{player2.name}!"
word = gets.chomp.downcase

game = Game.new(player1,player2,word)
game.display_blanks

while game.end_game? == "no"
  game.check_if_letter_in_word(player2.make_guess)
end
