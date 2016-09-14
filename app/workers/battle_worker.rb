class BattleWorker
  include Sidekiq::Worker
  def perform(battle_id)

				battle = Battle.find_by_id(battle_id)
				return unless battle.present?  #if battle is gone, there is no fight

				battle.handle_fight
				battle.send_battle_response
      			
  end
end