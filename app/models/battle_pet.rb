class BattlePet
  
  attr_accessor  :id, :status, :account_id, :strength, :agility, :wit, :speed, :wisdom, :intelligence, :magic, :chi, :healing_power, :experience
  
  def self.get_battle_pet pet_id

    uri = URI.parse(BATTLE_PET_MANAGER_ROOT_URL + pet_id.to_s + "/authed_get")
      http = Net::HTTP.new(uri.host, BATTLE_PET_MANAGER_ROOT_PORT)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
 
      data = JSON.parse(response.body)
      parse_pet_response_body data

  end

  def self.get_training_pet pet_id

    uri = URI.parse(BATTLE_PET_MANAGER_ROOT_URL + pet_id.to_s + "/generate_training_pet")
      http = Net::HTTP.new(uri.host, BATTLE_PET_MANAGER_ROOT_PORT)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Sets the HTTPS verify mode
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
 
    data = JSON.parse(response.body)
    BattlePet.parse_pet_response_body data
  end

    def self.parse_pet_response_body data
    battle_pet = BattlePet.new
      battle_pet.account_id = data['account_id'].present? ?  data['account_id'].to_i : -1
      battle_pet.strength = data['strength'].present? ?  data['strength'].to_d : 0
      battle_pet.agility = data['agility'].present? ?  data['agility'].to_d : 0
      battle_pet.wit = data['wit'].present? ?  data['wit'].to_d : 0
      battle_pet.speed = data['speed'].present? ?  data['speed'].to_d : 0
      battle_pet.wisdom = data['wisdom'].present? ?  data['wisdom'].to_d : 0
      battle_pet.intelligence = data['intelligence'].present? ?  data['intelligence'].to_d : 0
      battle_pet.magic = data['magic'].present? ?  data['magic'].to_d : 0
      battle_pet.chi = data['chi'].present? ?  data['chi'].to_d : 0
      battle_pet.healing_power = data['healing_power'].present? ?  data['healing_power'].to_d : 0
      battle_pet.experience = data['experience'].present? ?  data['experience'].to_i : 0
      battle_pet
  end

end
