
class Word
	attr_reader :x, :y 
	def initialize(x,y,string,vel)
		@string = string 
		@color = Gosu::Color.new(0xff_00ff00)
		@x = x
		@y = y
		@vel = vel 
		
	end

	def move
		@y = @y + @vel 
	end
	def draw
	 @font = Gosu::Font.new(20)
	 @font.draw(@string, @x, @y, ZOrder::Words, 1.0, 1.0, @color )
		
	end





end