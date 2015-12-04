require 'gosu'
require_relative "word"
require_relative "z_order"
#require_relative "simple_word"
#require_relative "compound_word"

class GameWindow < Gosu::Window
  def initialize
    super 1200, 500
    self.caption = "TYPESPEED"
    @background_image = Gosu::Image.new("media/background.jpeg", :tileable => true)
    @font = Gosu::Font.new(20)
    @font1= Gosu::Font.new(40)
    @words = Array.new
    @words.push(Word.new(600,0, "meep", 1, self))
    @health = 100
    @score = 0 
    @time = Gosu::milliseconds
  end

  def update
    @words.each { |word|
    	word.move
    }
    @words.each {|word|
      if word.is_at_bottom?
        @health -= 10
      end
    }
     @words.each { |word|
      if word.explode_drawn? == true 
        @words.delete(word)
      end
     }
    
    
  end

  def draw
    @background_image.draw(0, 0, 0)
    @font1.draw("TYPESPEED", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff )
    @font.draw("Score: #{@score}", 10, 50, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
	  @font.draw("Health: #{@health}",10, 70 , ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
    @words.each {|word| word.draw}
  end
end

window = GameWindow.new
window.show