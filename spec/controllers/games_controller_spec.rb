require 'rails_helper'

RSpec.describe GamesController, type: :controller do
	context 'GET #new' do
		it 'returns a success response' do
			user = User.create!(email: "test1@mail.com", password: "pass12345")

			sign_in user

			get :new
			expect(response).to be_success
		end
	end

	context 'GET #history' do
		it 'returns a success response' do
			
			user = User.create!(email: "test1@mail.com", password: "pass12345")
			opponent = User.create!(email: "test2@mail.com", password: "pass12345")
			
			sign_in user

			game = Game.new(user:user, opponent:opponent, user_score:19, opponent_score:10).save
			
			get :history, params: { id: user.to_param}
			expect(response).to be_success
		end
	end

end
