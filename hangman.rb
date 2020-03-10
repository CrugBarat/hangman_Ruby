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
      puts "\nEnter a letter"
      guess = gets.chomp

      good_guess = @word.first.include? guess

      if guess == "exit"
        puts "\nThank you, come again!"
      elsif good_guess
        puts "\nYay!"

        @correcr_guesses << guess

        print_teaser guess

        if @word.first == @word_teaser.split.join
          puts "\nWayhey! You smashed it! Run file to play again..."
          puts ""
        else
          make_guess
        end

      else
        @lives -= 1
        puts "\nBoooo! You have #{ @lives } lives left. Try again!"
        make_guess
      end
    else
      puts "\nGAME OVER!"
      puts "\nWAH WAH WAH...."
    end
  end

  def begin
    # ask user for a letter
    puts "\nHANGMAN IN TERMINAL"
    puts "\n(Type 'exit' to quit game at anytime)"
    puts ""
    print_teaser

    puts "\nClue: #{ @word.last }"

    make_guess
  end

end

game = Hangman.new
game.begin
