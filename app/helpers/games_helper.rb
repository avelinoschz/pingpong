module GamesHelper
	def opponent_name(game)
		if(current_user == game.user)
			game.opponent.just_name
		else
			game.user.just_name
		end
	end

	def result_to_s(game)
		if(current_user == game.user)
			game.result ? 'W' : 'L'
		else
			game.result ? 'L' : 'W'
		end
	end

	def score_to_s(game)
		if(current_user == game.user)
			"#{game.user_score}-#{game.opponent_score}"
		else
			"#{game.opponent_score}-#{game.user_score}"
		end
	end
end
