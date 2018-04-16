class User < ActiveRecord::Base
	include Elo

	after_initialize :set_defaults

	devise :database_authenticatable, :registerable, :trackable, :validatable

	scope :play_against, ->(user_id) { where.not(id: user_id) }

	def just_name
		self.email.split("@").first.capitalize
	end

	def games_played
		Game.games_played(id)
	end

	def play_against
		User.play_against(id)
	end

	def set_defaults
		self.ranking ||= 2000
	end
end