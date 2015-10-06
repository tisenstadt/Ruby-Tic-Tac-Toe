require_relative "./gameboard"
require_relative "./player"
require_relative "./endgame"
require_relative "./test"

class GameEngine 
	attr_accessor :player, :computer, :game, :gameover
	def initialize(args)
		@player = args[:player]
		@computer = set_computer_marker
		@game = args[:gameboard]
		@gameover = args[:endgame]
	end
	
	def launch_game 
		while true
		check_winner
		turn_controller			
		end
	end
	
	def check_winner
		if gameover.winner(game.board) || gameover.tie(game.board)
			if player.active == false && gameover.winner(game.board) 
				puts "Congratulations! You've won the game. Here's the final board:"
				game.boardprint
				exit(1)
			elsif player.active == true && gameover.winner(game.board) 
				puts "What a shame! You've lost this game of Tic-Tac-Toe. Here's the final board:"
				game.boardprint
				exit(1)
			else 
				puts "Holy smokes! Looks like it's a tie. You've played very well at this CHALLENGING difficulty level!"
				game.boardprint
				exit(1)
			end	
		end
	end
	
	def turn_controller
		if player.active 
			spot = get_human_spot
			update_with_human_move(spot)
			player.active = false
		else
			eval_board 
			player.active = true
		end
	end
				
			
	
	def set_computer_marker
		if player.marker == "X"
			computer = "O"
			puts " Your opponent will be playing as #{computer}. Let the games begin!!"
			return computer
		else
			computer = "X"
			puts " Your opponent will be playing as #{computer}. Let the games begin!!"
			computer
		end
	end
	
	def get_human_spot
	puts "It's your turn! Which spot do you want, my friend?"
	game.boardprint  
		while true
		spot = $stdin.gets.chomp.to_i
			if game.board[spot-1] != "X" && game.board[spot-1] != "O" && spot.between?(1,9)
				return spot
			else
				puts "Please enter an unoccupied spot on the board."     
			end 	
		end
    end
	
	def update_with_human_move(spot)
		game.board[spot-1] = player.marker
		game.boardprint
	end
	
	def eval_board	
		spot = minimax(game.board, 0)
		game.board[spot] = computer
		puts "Your opponent has moved to square #{spot+1}"		
	end	
	
	def scores_for_minimax
		if player.active 
			return 10
		else
			return -10
		end
	end
	
	def minimax(game, depth)
		if depth % 2 == 0  #Maintaining proper scoring.
			player.active = false
		elsif depth % 2 == 1
			player.active = true				
		end
				
		if gameover.winner(game) 
			return scores_for_minimax
		end
		if gameover.tie(game)
			return 0
		end
		scores = []
		moves = []
		spaces = identify_available_spaces(game)					
		spaces.each do |space|		
			if depth % 2 == 0   #Maintaining proper marker.
				player.active = false
			elsif depth % 2 == 1
				player.active = true
			end
				
			boardclone = game.clone	
			if player.active							
				boardclone[space] = player.marker																								
			else 								
				boardclone[space] = computer						
			end						
				scores.push(minimax(boardclone, depth+1))					
				moves.push(space)
		end
			
		if depth == 0
			max_score = scores.each_with_index.max[1]
			return moves[max_score]
		end
				
		if depth % 2 == 1
			scores.min
		elsif depth % 2 == 0
			scores.max
		end				
	end
				
	def identify_available_spaces(game)
		available_spaces = []
		game.each do |space|
			if space != "X" && space != "O"
				available_spaces.push(space-1)
			end
		end
		return available_spaces
	end
end



testboard = GameEngine.new(
	:player => Player.new,
	:gameboard => Gameboard.new,
	:endgame => Endgame.new
	)
testboard.launch_game
		