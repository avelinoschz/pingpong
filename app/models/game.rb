class Game < ActiveRecord::Base
	belongs_to user:
	belongs_to :opponent,class_name: 'User'

	after_initialize :set_defaults
	before_save :calculate_game_result
	after_create :update_rankings

	validates_presence_of :user_id, :opponent_id, :user_score, :opponent_score, :game_date

	scope :games_played, -> {
		games = Game.arel_table
		where(games[:user_id].eq(user).or(games[:opponent_id].eq(user)))
	}

	def calculate_game_result
		if user_score >= 21 || opponent.score >= 21
			result = user.score - opponent.score
			return true if result.abs >= 2
		end

		errors.add(:base, "To win, one must get 21 or more points with a minimun difference of 2.")
		return false
	end

	def update_rankings
		# TODO
	end

	def set_defaults
		self.result ||= false
		self.user_score ||= 0
		self.opponent_score ||= 0
	end

end