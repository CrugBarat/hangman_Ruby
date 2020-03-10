class Hangman

  def initialize
    @word = words.sample
    @lives = 7
    @correcr_guesses = []
    @word_teaser = ""

    @word.first.size.times do
      @word_teaser += "_ "
    end
  end

require_relative 'hangman_array'

  def print_teaser  last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
      if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
  end

  @word_teaser = new_teaser.join(' ')
end

  def make_guess
    if @lives > 0
      puts "Enter a letter"
      guess = gets.chomp

      good_guess = @word.first.include? guess

      if guess == "exit"
        puts "Thank you, come again!"
      elsif good_guess
        puts "Yay!"

        @correcr_guesses << guess

        print_teaser guess

        if @word.first == @word_teaser.split.join
          puts "Wayhey! Smashed it! Run file to play again..."
        else
          make_guess
        end

      else
        @lives -= 1
        puts "Boooo! You have #{ @lives } lives left. Try again!"
        make_guess
      end
    else
      puts "GAME OVER"
    end
  end

  def begin
    # ask user for a letter
    puts "New hangman game started..."
    puts "(Type 'exit' to quit game at anytime)"
    print_teaser

    puts "Clue: #{ @word.last }"

    make_guess
  end

end

game = Hangman.new
game.begin
