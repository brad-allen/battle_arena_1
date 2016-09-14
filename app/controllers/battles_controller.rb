class BattlesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_permissions
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  def index
    @battles = Battle.all
  end

  def show
  end

  def new
    @battle = Battle.new
  end

  def edit
  end

  def create
    @battle = Battle.new(battle_params)

    respond_to do |format|
      @battle.updated_by = admin_user_id
      @battle.created_by = admin_user_id
      if @battle.save
        format.html { redirect_to @battle, notice: 'Battle was successfully created.' }
        format.json { render :show, status: :created, location: @battle }
      else
        format.html { render :new }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @battle.updated_by = admin_user_id
      if @battle.update(battle_params)
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_battle
      @battle = Battle.find(params[:id])
    end

    def battle_params
      params.require(:battle).permit(:name, :description, :pet1_id, :pet2_id, :battled_on, :winning_pet_id, :winning_user_id, :battle_game_id, :play_for_keeps, :is_tie, :winner_experience, :loser_experience, :winner_gold)
    end
end
