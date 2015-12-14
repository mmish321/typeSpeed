
class Word
	
	attr_accessor :x, :y , :points, :string
	
	def initialize(string)
		@string = string 
		@color = Gosu::Color.new(0xff_00ffff)
		@x = rand(225..1000)
		@y = 0.00
		@vel = rand(0.20..1.00)
		@explosion = Gosu::Image.new("media/explosion.png")
		@exploded = false
		@explosion_drawn = false
		@font = Gosu::Font.new(24)
		@points = 10
	end

	def move
		@y = @y + @vel 
	end
	
	def draw
		 if self.is_at_bottom? == true
		 	@explosion_drawn = true 	
		 	@explosion.draw(@x - @explosion.width / 2.0, @y - @explosion.height/2.0, 
			 ZOrder::Words, 1, 1)	
		else
			@font.draw(@string, @x, @y, ZOrder::Words, 1.0, 1.0, @color )
		end
	end
 
	def is_at_bottom?
		if @y <= GameWindow::HEIGHT && @y >= 475.0
			@exploded = true
			return @exploded
		else
			 @exploded = false
			 return @exploded
		end
	end
	
	def explode_drawn?
		return @explosion_drawn
	end

end