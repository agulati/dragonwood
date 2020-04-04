class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games, id: :uuid do |t|
      t.references  :user,      null: false, type: :uuid, index: true
      t.boolean     :completed, null: false
      t.text        :adventurer_deck, null: false
      t.text        :dragonwood_deck, null: false
      t.text        :landscape,       null: false
      t.text        :user_hand,       null: false
      t.timestamps
    end

    add_foreign_key :games, :users
  end
end
