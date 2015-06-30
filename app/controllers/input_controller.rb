class InputController < ApplicationController
  def index
    @done_for_today = current_user.done_for_today?
    @moods = current_user.mood_list
    @has_moods = !@moods.empty?
    @moods.prepend(['Day', 'Happiness', 'Energy', 'Motivation'])
  end

  def create
    @mood = current_user.moods.new(happiness: params.require(:happiness),
                                   energy: params.require(:energy),
                                   motivation: params.require(:motivation))

    @mood.save
    redirect_to :back
  end
end