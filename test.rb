class Tests
def player_movetest
	puts "Testing Valid Board Entry with A Game In Progress. Test will accept any spot."
	game.board = ["X", 2, "X", "O", 5, 6, 7, "O", 9]
	player.marker = "X"
	spot = get_human_spot
	update_with_human_move(spot)
		if game.board[spot-1] == player.marker
			puts "pass"
		else 
			puts "fail"
		end
	end	
			
	def endgame_test_is_true
		puts "Testing if a GameOver win condition is recognized."
			endgame = gameover.winner(["X", "X", "X", 4, 5, 6, 7,8,9])
			if endgame == true
				puts "pass"
			else 
				puts "fail"
			end
		
	end
	
	def endgame_test_is_false
		puts "Ensuring that a false GameOver condition is processed correctly"
		endgame = gameover.winner([1, "X", "O", 4, 5, 6, 7, 8, 9])
		if endgame == true
			puts "fail"
		else 
			puts "pass"
		end	
	end
	
	def full_endgame_test
		puts "Test to ensure a player movement triggers the endgame condition"
		game.board = ["1", "X", "3", "4", "X", "6", "7", "8", "9"]
		update_with_human_move(8)
			if gameover.winner(game.board) == true
				puts "pass"
			else 
				puts "fail"
			end
	end
end