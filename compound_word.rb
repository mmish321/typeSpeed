require_relative "word"
class CompoundWord < Word 
	def initialize(string)
		super(string)
		@color = Gosu::Color.new(0xff_00ff00)
	end
	def move
		@vel = @vel + 0.5 * rand(0.05..0.10)
		@y += @vel * 0.5
			
	end
end