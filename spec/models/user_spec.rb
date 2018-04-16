require 'rails_helper'

RSpec.describe User, type: :model do

	subject { described_class.new }

	context 'scope tests' do

	end

	context 'rankings tests' do
		# let (:params) { {email: "test@mail.com", password: "pass12345"} }

		it 'starts at same ranking 2000' do
			expect(subject.ranking).to be == 2000
		end

		it 'should update rankings' do
			user = User.create!(email: "test1@mail.com", password: "pass12345")
			opponent = User.create!(email: "test2@mail.com", password: "pass12345")
			game = Game.new(user:user, opponent:opponent, user_score:21, opponent_score:19).save
			
			expect(user.ranking).to be > opponent.ranking
		end

	end

end
