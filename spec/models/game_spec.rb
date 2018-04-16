require 'rails_helper'

RSpec.describe Game, type: :model do

	context 'validation tests' do
		it 'ensures user presence' do
			game = Game.new(opponent_id:2, user_score:21, opponent_score:19, game_date:'2014-07-1', result:true).save
			expect(game).to eq(false)
		end

		it 'ensures opponent presence' do
			game = Game.new(user_id:1, user_score:21, opponent_score:19, game_date:'2014-07-1', result:true).save
			expect(game).to eq(false)
		end

		it 'should save succesfully' do
			user = User.create!(email: "test1@mail.com", password: "pass12345")
			opponent = User.create!(email: "test2@mail.com", password: "pass12345")
			game = Game.new(user:user, opponent:opponent, user_score:21, opponent_score:19).save
			
			expect(game).to eq(true)
		end
	end

	context 'game rules tests' do
		it 'should has 21 points to win' do
			user = User.create!(email: "test1@mail.com", password: "pass12345")
			opponent = User.create!(email: "test2@mail.com", password: "pass12345")
			game = Game.new(user:user, opponent:opponent, user_score:19, opponent_score:10).save
			
			expect(game).to eq(false)
		end

		it 'should has 2 points difference above 21' do
			user = User.create!(email: "test1@mail.com", password: "pass12345")
			opponent = User.create!(email: "test2@mail.com", password: "pass12345")
			game = Game.new(user:user, opponent:opponent, user_score:23, opponent_score:21).save
			
			expect(game).to eq(true)
		end
	end

end
