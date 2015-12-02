require 'gosu'
require_relative "word"
require_relative "z_order"

class GameWindow < Gosu::Window
  def initialize
    super 1200, 500
    self.caption = "TYPESPEED"
    @background_image = Gosu::Image.new("media/background.jpeg", :tileable => true)
    @font = Gosu::Font.new(20)
    @words = Array.new 
    

  end

  def update
    @words.move
    
  end

  def draw
    @background_image.draw(0, 0, 0)
    @font.draw("TYPESPEED", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff )
    @word.draw

  end
end

window = GameWindow.new
window.show