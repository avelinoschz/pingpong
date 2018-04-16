class HomeController < ApplicationController
  def index
  	@users = User.order(ranking: :desc)
  end

  def history
  	redirect_to games_history_path
  end

  def log
  	redirect_to new_game_path
  end
end
