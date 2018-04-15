require 'rails_helper'

RSpec.describe Game, type: :model do

	context 'validation tests' do

		it 'ensures user presence' do
			game = Game.new(opponent_id:1, user_score:21, opponent_score:19, game_date:'2014-07-1', result:true)
			expect(game).to eq(false)
		end

		it 'should save succesfully' do
			game = Game.new(user_id:1, opponent_id:2, user_score:21, opponent_score:19, game_date:'2014-07-1', result:true)
			expect(game).to eq(true)
		end

	end

end
