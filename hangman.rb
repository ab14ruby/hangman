
class Hangman

$LOAD_PATH << '.'
require 'module_screen.rb'


def self.draw(x)
  hangman = [" O","/","|","\\","/ ","\\"]
  if x == 0
    puts hangman[0]
  elsif x == 1
    puts hangman[0]
    print hangman[1]
  elsif x==2
    puts hangman[0]
    print hangman[1]
    print hangman[2]
  elsif x==3
    puts hangman[0]
    print hangman[1]
    print hangman[2]
    print hangman[3]
  elsif x==4

    puts hangman[0]
    print hangman[1]
    print hangman[2]
    puts hangman[3]
    print hangman[4]
  elsif x==5
    
    puts hangman[0]
    print hangman[1]
    print hangman[2]
    puts hangman[3]
    print hangman[4]
    print hangman[5]
    print hangman[6]

  end

end

def self.invalid(a,g)

until a.include?(g) == true

    puts "INVALID ENTRY"
    puts "Please guess from the available letters"
    print "> "
    g = gets.chomp.upcase.strip
  end

end



def self.guessmethod()
  puts "Guess a letter: "
  print "> "
  g = gets.chomp.upcase.strip
return g
end

def self.showLivesandAlphabet(alp,lives)
puts "\n\n"

  puts "Lives Remaining: #{lives}"
  puts "Letters Remaining: "

  alp.each do |x|
    print "#{x} "
  end
  puts "\n\n"
end

wrong = -1
puts "Choose one language to start "
puts "1-) English"
puts "2-) Turkish"
choice = gets.chomp


if(choice == "1")

  dictionary = File.open('dictionary.txt')
  dictionary_array = dictionary.readlines
  dictionary_array.shuffle!

elsif (choice =="2")
  dictionary = File.open('dictionary_tr.txt')
  dictionary_array = dictionary.readlines
  dictionary_array.shuffle!
end

puts "Type \"start\" to begin a new game\n"
turn = 0
rematch = nil

print "> "
user_word = gets.chomp.downcase.strip
until user_word == "start"
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
lives = 6 
  
  # yeniden denemk isterse veya ilk oyunsa
  if rematch == "new" || turn == 0
  word_array.each do |x|
    print "_ "
  end

  showLivesandAlphabet(alphabet,lives)

    guess=guessmethod()
  


  # harf secmek ıcın hakkı yyoksa veya harf kalmadıysa bu donguyu kıracagız
  until lives == 0 || letters_remaining == []
  Screen.clear
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
    
      showLivesandAlphabet(alphabet,lives)

      puts "\n\n"

      guess = guessmethod
   
    
         invalid(alphabet,guess)

  
    elsif lives > 1

      wrong += 1
      if wrong >= 0
        draw(wrong)
      end
      lives -= 1
      puts "\nWRONG!"
          alphabet.delete(guess)
  
      word_array.each do |x|
        if alphabet.include?(x.upcase) == true
          print "_ "
        else 
          print "#{x.upcase} "
        end
      end
    
      showLivesandAlphabet(alphabet,lives)

      puts "\n\n"
  
       guess = guessmethod
      
        invalid(alphabet,guess)


    else 
      lives -= 1
      wrong +=1
      draw(wrong)
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
  end
  
app = Hangman.new

