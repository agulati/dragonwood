class CreateGameState < ActiveRecord::Migration[6.0]
  def change
    create_table :game_states, id: :uuid do |t|
      t.references  :game,            null: false, type: :uuid, index: true
      t.text        :adventurer_deck, null: false
      t.text        :dragonwood_deck, null: false
      t.text        :landscape_deck,  null: false
      t.text        :user_hand,       null: false
      t.text        :bot_hand,        null: false
      t.timestamps
    end

    add_foreign_key :game_states, :games
  end
end
