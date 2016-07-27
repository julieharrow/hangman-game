class Hangman
  attr_accessor :available_parts, :hanged_parts

  def initialize(available_parts, hanged_parts)
    @available_parts, @hanged_parts = available_parts, hanged_parts
  end

  def add_body_part_until_hanged
      @hanged_parts << @available_parts.pop
  end

  def is_man_hanged?
    @available_parts == [] ? true : false
  end

  def show_hangman
    puts "You've hanged:  "
    print @hanged_parts
    puts ""
  end

end
