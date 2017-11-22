# HANGMAN

def replace(array, letter, word_guessed)
  count = 0
  array.each do |element|
    if element == letter
      word_guessed[count] = letter.upcase
    elsif word_guessed[count] == "X"
      word_guessed[count] = "X"
    end
    count += 1
  end
  word_guessed
end

def populate(array)
  word_guessed = []
  array.each do |element|
    if element == " "
      word_guessed << " "
    else
      word_guessed << "X"
    end
  end
  word_guessed
end

failed_attempts = 0
letters_guessed = []
game_over = false

puts "Please enter word or phrase for hangman"
word = gets.chomp.upcase

word_array = word.split("")
word_guessed = populate(word_array)

while game_over == false
  puts "Please enter a letter to guess"
  letter = gets.chomp.upcase
  if letter.split("").length > 1
    puts "Please enter one letter at a time!"
  else
    if letters_guessed.include?(letter)
      puts "You already guessed that letter, please try again."
    else
      letters_guessed << letter
      if word_array.include?(letter)
        puts "Yes the word/phrase has that letter"
        word_guessed = replace(word_array, letter, word_guessed)
      else
        puts "Sorry, that letter does not exist in the word/phrase."
        failed_attempts += 1
      end
    end
    puts "You have #{7-failed_attempts} guesses left"
    if failed_attempts == 7
      game_over = true
      puts "Sorry, you lose!"
    end
    unless word_guessed.include?("X")
      game_over = true
      puts "You Win!"
    end
  end
  puts "Game status:"
  p word_array
  p word_guessed

end
