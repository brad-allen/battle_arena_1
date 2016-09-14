class V1::BattleGamesController < V1::V1Controller
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin_permissions, except: [:index, :show]
  before_action :set_battle_game, only: [:show, :update]

  def index
    @battle_games = BattleGame.all
    respond_with clean_public_json @battle_games
  end

  def show
    respond_with clean_public_json @battle_game
  end

 def create
    @battle_game = BattleGame.new(battle_game_params)
    @battle_game.updated_by = admin_user_id
    @battle_game.created_by = admin_user_id

    return head(:internal_server_error) unless @battle_game.save

    respond_with @battle_game
  end

  def update
    @battle_game.updated_by = admin_user_id
    return head(:internal_server_error) unless @battle_game.update(battle_game_params)    

    respond_with @battle_game
  end

  private
    def set_battle_game
      @battle_game = BattleGame.find(params[:id])
    end

    def clean_public_json response
      response.as_json( :only => [:id, :name, :description, :status, :updated_by, :created_by, :update_at, :created_at] )
    end

    def battle_game_params
      params.permit(:name, :description, :strength, :agility, :wit, :speed, :wisdom, :intelligence, :magic, :chi, :healing, :status)
    end
end
