require 'gosu'
require_relative "word"
require_relative "z_order"
require_relative "compound_word"

class GameWindow < Gosu::Window
  
  def initialize
    super 1200, 500
    self.caption = "TYPESPEED"
    @background_image = Gosu::Image.new("media/background.jpeg", :tileable => true)
    @font = Gosu::Font.new(20)
    @bigfont= Gosu::Font.new(40)
    @biggestfont = Gosu::Font.new(100)
    data = File.read("words.txt")
    @words_on_screen = []
    @words = data.split(", ")
    @health = 100
    @score = 0 
    @time = Gosu::milliseconds
    @beep = Gosu::Sample.new("media/beep.wav")
    @explosion_sound = Gosu::Sample.new("media/explosion.wav")
   	self.text_input =Gosu::TextInput.new
  end

  def update
     @words_on_screen.each { |word|
      if word.explode_drawn? == true 
      	@explosion_sound.play
      	 @health -= 10
        @words_on_screen.delete(word)
      end
     }

    @words_on_screen.each { |word|
    	word.move
    }

    if (Gosu::milliseconds - @time) >= 60000
      if (Gosu::milliseconds - @time) % 6000 <= self.update_interval
        	@words_on_screen.push(Word.new(@words[(rand(@words.length-1)).to_i]))
          @words_on_screen.push(CompoundWord.new(@words[(rand(@words.length-1)).to_i] + @words[(rand(@words.length-1)).to_i]))
       elsif (Gosu::milliseconds - @time) % 3000 <= self.update_interval
          @words_on_screen.push(Word.new(@words[(rand(@words.length-1)).to_i]))
      end    
    elsif (Gosu::milliseconds - @time) % 3000 <= self.update_interval
          @words_on_screen.push(Word.new(@words[(rand(@words.length-1)).to_i]))
    end  

    if Gosu::button_down? Gosu::KbReturn
  	   @words_on_screen.each { |word|
  	    if self.text_input.text.eql? word.string 
  	     @score += word.points
  	     @beep.play
  	     @words_on_screen.delete(word)	
  	   end
  	   } 
  	  self.text_input = nil 
  		self.text_input =Gosu::TextInput.new 
   	end

   	if @health <= 0
       	@words_on_screen.clear
    end
 
  end


  
  def draw
    @background_image.draw(0, 0, 0)
    @bigfont.draw("TYPESPEED", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff )
    @font.draw("Score: #{@score}", 10, 50, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
	  @font.draw("Health: #{@health}",10, 70, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
    @words_on_screen.each {|word| word.draw}
    if @health <= 0
      @biggestfont.draw("GAME OVER", 300, 150, ZOrder::UI, 1.0, 1.0, 0xff_ff0000)
      @biggestfont.draw("Final Score : #{@score}", 300, 300, ZOrder::UI, 1.0, 1.0, 0xff_ff0000 )
    end
  end
  
 
 
  def button_down(id)
     if id == Gosu::KbReturn && @health <= 0
	    self.caption = "TYPESPEED"
	    @background_image = Gosu::Image.new("media/background.jpeg", :tileable => true)
	    @font = Gosu::Font.new(20)
	    @font1= Gosu::Font.new(40)
	    @font2 = Gosu::Font.new(100)
	    data = File.read("words.txt")
	    @words_on_screen = []
	    @words = data.split(", ")
	    @health = 100
	    @score = 0 
	    @time = Gosu::milliseconds
	    @beep = Gosu::Sample.new("media/beep.wav")
	    @explosion = Gosu::Sample.new("media/explosion.wav")
	   	self.text_input =Gosu::TextInput.new
	  elsif id == Gosu::KbEscape
	  	close
     end
  end

end


window = GameWindow.new
window.show
