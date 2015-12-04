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
    @font2 = Gosu::Font.new(100)
    data = File.read("words.txt")
    @object_words = []
    @words = data.split(", ")
 
    @health = 100
    @score = 0 
    @time = Gosu::milliseconds
  end

  def update
    @object_words.each { |word|
    	word.move
    }
    @object_words.each {|word|
      if word.is_at_bottom?
        @health -= 10
      end
    }
     @object_words.each { |word|
      if word.explode_drawn? == true 
        @object_words.delete(word)
      end
     }
     if Gosu::milliseconds > @time 
      @object_words.push(Word.new(rand(1000),0, @words[(rand(@words.length-1)).to_i], rand ,self))
      @time += 1000
      end
    if @health <= 0
      @object_words.clear
    end
  end

  def input_of_user

    
  end

  def draw
    @background_image.draw(0, 0, 0)
    @font1.draw("TYPESPEED", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff )
    @font.draw("Score: #{@score}", 10, 50, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
	  @font.draw("Health: #{@health}",10, 70 , ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
    @object_words.each {|word| word.draw}
    if @health <= 0
      @font2.draw("GAME OVER", 300, 250, ZOrder::UI, 1.0, 1.0, 0xff_ff0000)
    end
  end
end

window = GameWindow.new
window.show