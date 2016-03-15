class Player
	attr_accessor :first, :marker
	def initialize
		@marker = false
		@first = false
	end
end

class Human < Player
end

class Computer < Player
end
