class BattleGamesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_permissions  
  before_action :set_battle_game, only: [:show, :edit, :update, :destroy]

  def index
    @battle_games = BattleGame.all
  end

  def show
  end

  def new
    @battle_game = BattleGame.new
  end

  def edit
  end

  def create
    @battle_game = BattleGame.new(battle_game_params)

    respond_to do |format|
      @battle_game.updated_by = admin_user_id
      @battle_game.created_by = admin_user_id
      if @battle_game.save
        format.html { redirect_to @battle_game, notice: 'Battle game was successfully created.' }
        format.json { render :show, status: :created, location: @battle_game }
      else
        format.html { render :new }
        format.json { render json: @battle_game.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @battle.updated_by = admin_user_id
      if @battle_game.update(battle_game_params)
        format.html { redirect_to @battle_game, notice: 'Battle game was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle_game }
      else
        format.html { render :edit }
        format.json { render json: @battle_game.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_battle_game
      @battle_game = BattleGame.find(params[:id])
    end

    def battle_game_params
      params.require(:battle_game).permit(:name, :description, :play_for_keeps, :winner_experience, :loser_experience, :winner_gold, :strength, :agility, :wit, :speed, :wisdom, :intelligence, :magic, :chi, :healing, :status)
    end
end
