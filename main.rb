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
    @font1= Gosu::Font.new(40)
    @font2 = Gosu::Font.new(100)
    data = File.read("words.txt")
    @object_words = []
    @words = data.split(", ")
    @health = 100
    @score = 0 
    @time = Gosu::milliseconds
    @beep = Gosu::Sample.new("media/beep.wav")
    @explosion = Gosu::Sample.new("media/explosion.wav")
   	self.text_input =Gosu::TextInput.new
  end

  def update
     @object_words.each { |word|
      if word.explode_drawn? == true 
      	@explosion.play
      	 @health -= 10
        @object_words.delete(word)
      end
     }

    @object_words.each { |word|
    	word.move
    }

    if Gosu::milliseconds> @time && @time <= 60000
      @object_words.push(Word.new(@words[(rand(@words.length-1)).to_i]))
      @time += 3000
  	elsif Gosu::milliseconds > @time  && @time >= 60000
      	@object_words.push(Word.new(@words[(rand(@words.length-1)).to_i]))
      @object_words.push(CompoundWord.new(@words[(rand(@words.length-1)).to_i] + @words[(rand(@words.length-1)).to_i]))
      	@time += 6000
    end
    

     if Gosu::button_down? Gosu::KbReturn
	    @object_words.each { |word|
	     if self.text_input.text.eql? word.string 
	     	@score += word.points
	     	@beep.play
	     	@object_words.delete(word)	
	     end
	    } 
	    self.text_input = nil 
		self.text_input =Gosu::TextInput.new 
 	end

 	if @health <= 0
     	@object_words.clear
     end
 end
  def draw
    @background_image.draw(0, 0, 0)
    @font1.draw("TYPESPEED", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff )
    @font.draw("Score: #{@score}", 10, 50, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
	@font.draw("Health: #{@health}",10, 70, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
    @object_words.each {|word| word.draw}
    if @health <= 0
      @font2.draw("GAME OVER", 300, 150, ZOrder::UI, 1.0, 1.0, 0xff_ff0000)
      @font2.draw("Final Score : #{@score}", 300, 300, ZOrder::UI, 1.0, 1.0, 0xff_ff0000 )
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
	    @object_words = []
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
