class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games, id: :uuid do |t|
      t.references  :user,      null: false, type: :uuid, index: true
      t.boolean     :completed, null: false
      t.timestamps
    end

    add_foreign_key :games, :users
  end
end
