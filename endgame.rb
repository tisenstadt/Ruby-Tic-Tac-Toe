class Endgame
	def winner(b)
		if
		[b[0], b[1], b[2]].uniq.length == 1 ||
		[b[3], b[4], b[5]].uniq.length == 1 ||
		[b[6], b[7], b[8]].uniq.length == 1 ||
		[b[0], b[3], b[6]].uniq.length == 1 ||
		[b[1], b[4], b[7]].uniq.length == 1 ||
		[b[2], b[5], b[8]].uniq.length == 1 ||
		[b[0], b[4], b[8]].uniq.length == 1 ||
		[b[2], b[4], b[6]].uniq.length == 1
		return true
		end
	 end
	
	
	def tie(b)
		if b.all? { |s| s == "X" || s == "O" }
			return true
		end
	end	
end