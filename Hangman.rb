
dictionary = File.open('dictionary.txt')
dictionary_array = dictionary.readlines
dictionary_array.shuffle!



def draw(x)
  hangman = [" O","/","|","\\","/","|","\\"]
  puts hangman[0..x]


end

wrong = -1

puts "Type \"1\" to begin a new game\n"
turn = 0
rematch = nil

print "> "
user_word = gets.chomp.downcase.strip
until user_word == "1"
print "> "
user_word = gets.chomp.downcase.strip
end

until rematch == "quit"

  # yeni bir kelimeyi shuffle ile rastgele alıyoruz sonrasında bu kelimenin harflerinden kelimeye uygun bir array cıkartıyoruz
  dictionary_array.shuffle!
  word = dictionary_array[0]
  word_array = word.chars.to_a
  letters_remaining = dictionary_array[0].chars.to_a
  # \n i silmek icin
  word_array.delete_at(word_array.length)
  letters_remaining.delete_at(letters_remaining.length-1)


# alfabeyi tanımladık
alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", 
"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
lives = word.length  
  
  # yeniden denemk isterse veya ilk oyunsa
  if rematch == "new" || turn == 0
  word_array.each do |x|
    print "_ "
  end
  puts "\n\n"
  puts "Lives Remaining: #{lives}"
  puts "Letters Remaining: "

  alphabet.each do |x|
    print "#{x} "
  end
  puts "\n\n"

  puts "Guess a letter: "
  print "> "
  guess = gets.chomp.upcase.strip

  until alphabet.include?(guess) == true
    puts "INVALID ENTRY"
    puts "Please guess from the available letters"
    print "> "
    guess = gets.chomp.upcase.strip
  end

  # harf secmek ıcın hakkı yyoksa veya harf kalmadıysa bu donguyu kıracagız
  until lives == 0 || letters_remaining == []
  
    if word_array.include?(guess.downcase) == true
    
      if wrong >= 0
        draw(wrong)
      end

      puts "\n\n"
      alphabet.delete(guess)  
      letters_remaining.delete(guess.downcase)
    
      if letters_remaining == []
        break
      end
  
      word_array.each do |x|
        if alphabet.include?(x.upcase) == true
          print "_ "
        else 
          print "#{x.upcase} "
        end
      end
    
      puts "\n\n"
      puts "Lives Remaining: #{lives}"
      puts "Letters Remaining: "

      alphabet.each do |x|
        print "#{x} "
      end
      puts "\n\n"
  
      puts "Guess a letter: "
      print "> "
      guess = gets.chomp.upcase.strip
   
      until alphabet.include?(guess) == true
         puts "INVALID ENTRY"
         puts "Please guess from the available letters"
         print "> "
         guess = gets.chomp.upcase.strip
      end
  
    elsif lives > 1

      wrong += 1
      if wrong >= 0
        draw(wrong)
      end
      lives -= 1
      puts "WRONG!\n\n"
      alphabet.delete(guess)
  
      word_array.each do |x|
        if alphabet.include?(x.upcase) == true
          print "_ "
        else 
          print "#{x.upcase} "
        end
      end
    
      puts "\n\n"
      puts "Lives Remaining: #{lives}"
      puts "Letters Remaining: "

      alphabet.each do |x|
        print "#{x} "
      end
      puts "\n\n"
  
      puts "Guess a letter: "
      print "> "
      guess = gets.chomp.upcase.strip
   
      until alphabet.include?(guess) == true
         puts "INVALID ENTRY"
         puts "Please guess from the available letters"
         print "> "
         guess = gets.chomp.upcase.strip
      end


    else 
      lives -= 1
      puts "YOU LOSE!\n"
      puts "The word was #{word_array.to_s.upcase}"
    end  
  
  end 

  if letters_remaining == []
    puts "CONGRATULATIONS! You got the word #{word_array.to_s.upcase}" 
  end   

  turn += 1
  puts "Type \"new\" to play again, type \"quit\" to exit"
  print "> "
  rematch = gets.chomp.downcase.strip
  else
  puts "Please type either \"new\" OR \"quit\""
  end

end



