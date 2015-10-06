class Player
	attr_accessor :marker, :active
	def initialize
		@marker = choose_marker
		@active = goes_first
	end
	
	def choose_marker
		puts "Welcome to my implementation of Tic-Tac-Toe! You will be playing this game against a CUNNING computer opponent! I hope you find it enjoyable and challenging. Please enter a marker, either X or O, and we'll get started."
		while true
		marker = $stdin.gets.chomp.upcase
			if marker == 'X' || marker == 'O'
				puts "Great! You're playing as #{marker.upcase}."
				return marker
			else 
				puts "Please enter a valid marker, either X or O."
			end
		end
	end
	
	def goes_first
		puts "One other thing before we get down to business. Please enter 1 if you would like to go first. Enter anything else and the computer will go first. Choose wisely!"
		order = $stdin.gets.chomp.to_i
		if order == 1
			print "Great! Looks like you're going first."
			return true
		else
			print "You might be sorry you didn't go first. Good luck!"
			return false
		end
	end
			
			
end