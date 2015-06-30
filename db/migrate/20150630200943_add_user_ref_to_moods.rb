class AddUserRefToMoods < ActiveRecord::Migration
  def change
    add_reference :moods, :user, index: true, foreign_key: true
  end
end
