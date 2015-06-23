class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer :happiness
      t.integer :energy
      t.integer :motivation

      t.timestamps null: false
    end
  end
end
