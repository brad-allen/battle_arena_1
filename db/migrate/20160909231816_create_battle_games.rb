class CreateBattleGames < ActiveRecord::Migration[5.0]
  def change
    create_table :battle_games do |t|
      t.string :name
      t.string :description
      t.decimal :strength, default: 0, null: false
      t.decimal :agility, default: 0, null: false
      t.decimal :wit, default: 0, null: false
      t.decimal :speed, default: 0, null: false
      t.decimal :wisdom, default: 0, null: false
      t.decimal :intelligence, default: 0, null: false
      t.decimal :magic, default: 0, null: false
      t.decimal :chi, default: 0, null: false
      t.decimal :healing, default: 0, null: false      
      t.integer :winner_experience, default: 0, null: false
      t.integer :loser_experience, default: 0, null: false
      t.integer :winner_gold, default: 0, null: false
      t.string :status
      t.integer :updated_by
      t.integer :created_by

      t.timestamps
    end


    add_index :battle_games, :name, :name => 'battle_games_name_idx'
    add_index :battle_games, :status, :name => 'battle_games_status_idx'

  end
end
