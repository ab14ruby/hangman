#!/usr/bin/env ruby
#-------------------------------------------------------------
#Hangman Projesi Part 1 By Candan Benturk Version 0.0.1 Beta--
#-------------------------------------------------------------
#DIKKAT>>> hangman.rb, hangman.txt ve module_screen.rb files--
#----------ayni dosya icinde olmalidirlar.--------------------
#-------------------------------------------------------------

#Kelimeyi Random Sec
@r = rand(11)
#puts " Testing random number generator kelimeler icin  #@r"

#Kelimeyi dosyadan okuma methodu
#hangman text dosyasindaki satirlari lines adli diziye aktariyoruz
lines = IO.readlines("hangman.txt")

#Test line to verify dizin dogru geldi.
#puts lines

# kelimemizi secelim
kelime = lines[@r].chomp.to_s

#MODULE Egzersizi yapalim
# Simdi daha onceden yazdigim clear screen modulumuzu yukliyelim

$LOAD_PATH << '.'

require 'module_screen.rb'

Screen.clear

#Module sonu


#---------------------------------------------------------------------------------------
#-------------------------Candan Benturk Ilk Section finished---------------------------
#-------------------Asagida bazi fikirler degisik web sitelerinden----------------------
#---------------------------------------------------------------------------------------


#test yeni secilen kelimeyi test edelim
puts kelime

#Kelime Gizleme Methodumuz get_display() METHODu ile
def get_display(kelime)
    # Secilen kelimeye gore gizleme methodu icin
    # - tre isareti kullaniyoruz
    disp=''
    for i in 0...kelime.length
        disp=disp + '-'
    end
    return disp
end
puts
puts get_display(kelime)



#HARFIN KELIMENIN ICINDE OLDUGUNU BULALIM

def is_letter_in_word(kelime,harf)
    # harfin kelimenin icinde olup olmadigina bakalim.
    
end

#UPDATE Oyun EKRANINI SAYET HARF ESLESMESI VAR ISE
def get_letter(word,letter,display)
    # BU GET_LETTER method'u hangman tarafindan cagriliyor eger yukardaki  is_letter_in_word methodu
    # geriye  TRUE Gonderiyor is
    # Parametereleri: Dogru tahmin edilen harf ile, gizli kelime,
    # ve Gizli Kelimenin su andaki  Display Durumu.
    
end

#    *RETURN 'kazandi' sayet oyun bittiyse
#    *RETURN 'kaybetti' sayet oyunu kaybettiyse
#    *RETURN 'devam' oyun bitmediyse


def is_finished(word, display, left)
    # Bu method her zaman bor harfin dogru tahmin edildigi zaman cagriliyor. 
    # Bu methodun ana gorevi oyunun kazanildiginin, kaybedildiginin veya devam 
    # ettiginin hesaplanmasi
    # input parametreleri gizli kelime (kelime), the
    # oyunun su anindanki Graphic Display'i  (display), Geriye kalan oyun denemeleri (left)
    # Return "kazandi " eger kelime basari ile kazanildiysa,
    # Return "lose"  eger oyun deneme haklari bittiyse  ve kaybedildiyse
    # Return "continue" eger halen oyun deneme haklari var ise.
end