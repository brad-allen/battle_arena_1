require 'json'

class Battle < ApplicationRecord
	validates :name, presence: true, length: { maximum: 100 }
  	validates :user1_id, presence: true, numericality: { only_integer: true }
  	validates :user2_id, presence: true, numericality: { only_integer: true }
  	validates :pet1_id, presence: true, numericality: { only_integer: true }
  	validates :pet2_id, presence: true, numericality: { only_integer: true }
  	validates :status, presence: true, length: { maximum: 25 }, inclusion: { in: %w(auto-accepted battled invited accepted legendary denied), message: "Status is not valid" }, allow_nil: false

	def handle_fight

	 	pet1 = BattlePet.get_battle_pet pet1_id.to_i, self.call_auth_code
	    pet2 = (pet2_id.to_i <= 0 ? BattlePet.get_training_pet(pet1_id) : BattlePet.get_battle_pet(pet2_id.to_i, self.call_auth_code))
	    battle_game = BattleGame.find_by_id(battle_game_id.to_i) 
	    battle_game = (battle_game.present? ? battle_game : BattleGame.first())

		score = calculate_battle_results pet1, pet2, battle_game

		self.score = score 
		self.battled_on = DateTime.now.new_offset(0)
		self.status = "battled"
		self.winner_experience = battle_game.winner_experience
		self.loser_experience = battle_game.loser_experience
		self.winner_gold = battle_game.winner_gold

		if score != 0
			self.winning_pet_id = score > 0 ? pet1_id : pet2_id
			self.winning_user_id = score > 0 ? user1_id : user2_id			
		elsif score == 0 && pet1.experience == pet2.experience
			self.is_tie = 1				
		else
			self.winning_pet_id =  pet1.experience > pet2.experience ? pet1_id : pet2_id
			self.winning_user_id =  pet1.experience > pet2.experience ? user1_id : user2_id
		end
	end


	def send_battle_response
		
      	puts "SENDING BATTLE RESPONSE" + self.inspect
		uri = URI.parse(BATTLE_PET_MANAGER_ROOT_URL + 'v1/battles/' + id.to_s + '/battle_update')

	    http = Net::HTTP.new(uri.host, BATTLE_PET_MANAGER_ROOT_PORT)
	    if USE_SSL
	    	http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		end
	    request = Net::HTTP::Post.new(uri.request_uri)
	    request.set_form_data(self.as_json)

	    http.request(request)

	    self.call_auth_code = nil
	    self.save
	end


	private

	def calculate_battle_results pet1, pet2, battle_game
		puts "BATTLE PET ONE => " + pet1.inspect
		puts "BATTLE PET TWO => " + pet2.inspect
		puts "BATTLE GAME => " + battle_game.inspect
		
		pet1_points = pet1.strength*battle_game.strength + pet1.agility*battle_game.agility + pet1.wit*battle_game.wit + pet1.speed*battle_game.speed + pet1.wisdom*battle_game.wisdom + pet1.intelligence*battle_game.intelligence + pet1.magic*battle_game.magic + pet1.chi*battle_game.chi + pet1.healing_power*battle_game.healing
	    pet2_points = pet2.strength*battle_game.strength + pet2.agility*battle_game.agility + pet2.wit*battle_game.wit + pet2.speed*battle_game.speed + pet2.wisdom*battle_game.wisdom + pet2.intelligence*battle_game.intelligence + pet2.magic*battle_game.magic + pet2.chi*battle_game.chi + pet2.healing_power*battle_game.healing
		score = pet1_points-pet2_points
		puts "BATTLE SCORE => " + score.inspect
		score
	end

end
