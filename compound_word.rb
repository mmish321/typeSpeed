require_relative "word"

class CompoundWord < Word 
	
	attr_accessor :x, :y, :points
	
	def initialize(string)
		super(string)
		@color = Gosu::Color.new(0xff_00ff00)
		@points = 20 
	end

	def move
		@vel = @vel + 0.5 * rand(0.05..0.07)#This is the acceleration
		@y += @vel * 0.25
	end
	
end