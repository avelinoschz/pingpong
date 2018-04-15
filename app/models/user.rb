class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable, :trackable, :validatable

	def set_defaults
		self.ranking ||= 2000
	end
end
