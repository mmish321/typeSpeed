
class Word
	attr_accessor :x, :y 
	

	def initialize(x,y,string,vel,window)
		@string = string 
		@color = Gosu::Color.new(0xff_00ff00)
		@x = x
		@y = y
		@vel = vel 
		@window = window
		@explosion = Gosu::Image.new("media/explosion.png")
		@exploded = false
		@explode_drawn = false
		
	end

	def move
		@y = @y + @vel 
	end
	
	def draw
		 @font = Gosu::Font.new(20)
		 if self.is_at_bottom? == true
		 	@explode_drawn = true
		 	@explosion.draw(@x - @explosion.width / 2.0, @y - @explosion.height / 2.0,
			ZOrder::Words, 1, 1)	
		else
			@font.draw(@string, @x, @y, ZOrder::Words, 1.0, 1.0, @color )
		end
	end

	def is_at_bottom?
		if @y == 500
			@exploded = true
			return @exploded
		end
		
	end
	def explode_drawn?
		return @explode_drawn
		
	end





end