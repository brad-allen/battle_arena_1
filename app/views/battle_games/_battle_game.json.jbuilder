json.extract! battle_game, :id, :name, :description, :strength, :agility, :wit, :speed, :wisdom, :intelligence, :magic, :chi, :healing, :status, :updated_by, :created_by, :winner_experience, :loser_experience, :winner_gold, :created_at, :updated_at
json.url battle_game_url(battle_game, format: :json)