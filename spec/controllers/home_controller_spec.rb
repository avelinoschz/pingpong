require 'rails_helper'

RSpec.describe HomeController, type: :controller do
	context 'GET #index' do
		it 'returns a success response' do
			user = User.create!(email: "test1@mail.com", password: "pass12345")

			sign_in user
			
			get :index
			expect(response.success?)
		end
	end
end
