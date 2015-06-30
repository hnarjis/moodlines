class InputController < ApplicationController
  def index
    @moods = []
    first_mood = current_user.moods.order(:created_at).first
    return if first_mood.nil?
    day = first_mood.created_at.yesterday.strftime('%F')
    happiness = 0
    energy = 0
    motivation = 0
    @moods = [['Day', 'Happiness', 'Energy', 'Motivation'],[day, happiness, energy, motivation]]
    current_user.moods.all.order(:created_at).each do |mood|
      day = mood.created_at.strftime('%F')
      happiness += mood.happiness
      energy += mood.energy
      motivation += mood.motivation
      @moods << [day, happiness, energy, motivation]
    end
  end

  def create
    @mood = current_user.moods.new(happiness: params.require(:happiness),
                     energy: params.require(:energy),
                     motivation: params.require(:motivation))

    @mood.save
    redirect_to :back
  end
end