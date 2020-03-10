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

  def words
    [
      ["football", "22 humans but no hands"],
      ["cinema", "Grab some popcorn"],
      ["carbonated", "Shakey bubbles"],
      ["dinosaur", "Cold-blooded history"],
      ["headphones", "Music to your ears"],
      ["cactus", "Never thirsty"],
      ["charger", "Electron transporter"],
      ["narwhal", "One tuskateer"],
      ["kettle", "Click for heat"],
      ["photograph", "Immortal paper"],
      ["extension", "Longing for more"],
      ["nectarine", "Juicy fruit"],
      ["bluetooth", "Poor oral hygiene"],
      ["telephone", "Far reaching words"],
      ["microwave", "You spin me right round"],
      ["gorilla", "You after a laborious shave"],
      ["bungalow", "Ground zero"],
      ["recliner", "Relax!"],
      ["painting", "An oily scene"],
      ["fireworks", "Very high BOOM"],
      ["wreath", "A decorative circle"],
      ["casino", "Man Vs House"],
      ["accident", "Don't blame me!"],
      ["addition", "More not less"],
      ["networks", "Fishing for interconnected people"],
      ["committed", "Focus your insanity"],
      ["kangaroo", "Australian kick boxer"],
      ["airplane", "Skim wood in the clouds"],
      ["universal", "One thing to fit them all"],
      ["synthetic", "Person-made"],
      ["compound", "An interested mixture"],
    ]
  end

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
          puts "Wayhey! Smashed it!"
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
