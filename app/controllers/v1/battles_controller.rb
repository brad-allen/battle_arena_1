require "net/http"
require "uri"
require 'thread'

class V1::BattlesController < V1::V1Controller
  before_action :set_battle, only: [:show]

   def index
    @battles = Battle.all
    respond_with @battles
  end

  def show
    respond_with @battle
  end

  def fight
    fight_values = params.permit(:name, :description, :call_auth_code, :user1_id, :user2_id, :pet1_id, :pet2_id, :status, :battle_game_id, :status)
    battle = Battle.new(fight_values)
    battle.original_id = params[:id]
    battle.created_by = params[:user1_id].to_i
    battle.updated_by = params[:user1_id].to_i
    battle.save

    puts "FIGHT ==>" + battle.inspect
    #Send it to sidekiq
    BattleWorker.perform_async(battle.id)

    head(:ok)
  end

  private

    def set_battle
      @battle = Battle.find(params[:id])
    end

end
