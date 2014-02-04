class Score

  def initialize
    @score = 0
  end
  
  def displayScore(charArray, key)
    print "Score: #{calculate(charArray, key)}"
  end

  ## Test icin method, silinebilir
  def test
     text = gets.chomp.upcase.split("")
     puts "Text: #{text}"

     char = gets.chomp.upcase
     puts "Word: #{char}"

     displayScore(text, char)
  end

  private

  def calculate(charArray, key)
    charArray.each { |x| if x == key then @score += 100 end}
    @score
  end
end
