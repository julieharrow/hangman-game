class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def get_word

  end

  def make_guess
    puts "#{@name}, guess a letter:"
    return gets.chomp.downcase
  end

end
