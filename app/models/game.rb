class Game < ActiveRecord::Base
	belongs_to :user
	belongs_to :opponent, class_name: 'User'

	after_initialize :set_defaults
	before_save :game_rules
	after_create :update_rankings

	scope :games_played, ->(user_id) { where("user_id = ? OR opponent_id = ?", user_id, user_id) }

	validates_presence_of :user_id, :opponent_id
	validate :winner

	def winner
		if user_score > opponent_score
			self.result = true
		end

	end

	def game_rules
		if user_score >= 21 || opponent_score >= 21
			result = user_score - opponent_score
			return true if result.abs >= 2
		end

		errors.add(:base, "To win, one must get 21 or more points with a minimun difference of 2.")
		return false
	end

	def update_rankings
		self.user.update_rankings self
	end

	def set_defaults
		self.result ||= false
		self.user_score ||= 0
		self.opponent_score ||= 0
		self.game_date ||= Date.today
	end

end