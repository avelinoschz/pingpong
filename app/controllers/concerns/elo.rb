module Elo
	extend ActiveSupport::Concern

	def update_rankings game
		rankings = new_rankings(self.ranking, game.opponent.ranking, game.result ? 1:0)

		self.update ranking: rankings['player1']
		game.opponent.update ranking: rankings['player2']
	end

	def new_rankings(player1_ranking,player2_ranking,result,k_value=32,should_round=true)
		#Assign actual individual results
		player1_result = result
		player2_result = 1 - result

		#Calculate expected results
		player1_expectation = 1/(1+10**((player2_ranking - player1_ranking)/400.0)) #the .0 is important to force float operations!))
		player2_expectation = 1/(1+10**((player1_ranking - player2_ranking)/400.0))

		#Calculate new rankings
		player1_new_ranking = player1_ranking + (k_value*(player1_result - player1_expectation))
		player2_new_ranking = player2_ranking + (k_value*(player2_result - player2_expectation))

		#Optional rounding
		if should_round
		  # int rounds down and forces type
		  player1_new_ranking = player1_new_ranking.round
		  player2_new_ranking = player2_new_ranking.round
		end 
		
		# Create a dictionary to return and do so!
		new_rankings_hash = Hash.new
		new_rankings_hash['player1'] = player1_new_ranking
		new_rankings_hash['player2'] = player2_new_ranking
		
		new_rankings_hash
	end
end