require "gosu"
require_relative "z_order"

class GameWindow < Gosu::Window
	def initalize(size)
		super size, size
		self.caption = "TYPESPEED"
		@background_image = Gosu::Image.new("media/background.jpg" , :tileable => true )
	end

	 # def draw
  #   @background_image.draw(0, 0, ZOrder::Background)
  # end


end

window = GameWindow.new(1000, 1000)
window.show