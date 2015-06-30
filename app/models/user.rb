class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :moods

  def done_for_today?
    moods.order(:created_at).last.created_at.to_date == Date.today
  end

  def first_mood
    moods.order(:created_at).first
  end

  def mood_list
    if first_mood.nil?
      return []
    end
    day = first_mood.created_at.yesterday.strftime('%F')
    happiness = 0
    energy = 0
    motivation = 0
    result = [[day, happiness, energy, motivation]]
    moods.all.order(:created_at).each do |mood|
      day = mood.created_at.strftime('%F')
      happiness += mood.happiness
      energy += mood.energy
      motivation += mood.motivation
      result << [day, happiness, energy, motivation]
    end
    return result
  end
end
