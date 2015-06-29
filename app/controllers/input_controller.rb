class InputController < ApplicationController
  before_filter :authenticate_user!

  def index
    day = Mood.order(:created_at).first.created_at.yesterday.strftime('%F')
    happiness = 0
    energy = 0
    motivation = 0
    @moods = [['Day', 'Happiness', 'Energy', 'Motivation'],[day, happiness, energy, motivation]]
    Mood.all.order(:created_at).each do |mood|
      day = mood.created_at.strftime('%F')
      happiness += mood.happiness
      energy += mood.energy
      motivation += mood.motivation
      @moods << [day, happiness, energy, motivation]
    end
  end

  def create
    @mood = Mood.new(happiness: params.require(:happiness),
                     energy: params.require(:energy),
                     motivation: params.require(:motivation))

    @mood.save
    redirect_to :back
  end
end