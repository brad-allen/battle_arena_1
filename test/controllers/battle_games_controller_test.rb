require 'test_helper'

class BattleGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @battle_game = battle_games(:one)
  end

  test "should get index" do
    get battle_games_url
    assert_response :success
  end

  test "should get new" do
    get new_battle_game_url
    assert_response :success
  end

  test "should create battle_game" do
    assert_difference('BattleGame.count') do
      post battle_games_url, params: { battle_game: { agility: @battle_game.agility, chi: @battle_game.chi, created_by: @battle_game.created_by, description: @battle_game.description, healing: @battle_game.healing, intelligence: @battle_game.intelligence, loser_experience: @battle_game.loser_experience, magic: @battle_game.magic, name: @battle_game.name, play_for_keeps: @battle_game.play_for_keeps, speed: @battle_game.speed, status: @battle_game.status, strength: @battle_game.strength, updated_by: @battle_game.updated_by, winner_gold: @battle_game.winner_gold, winner_experience: @battle_game.winner_experience, wisdom: @battle_game.wisdom, wit: @battle_game.wit } }
    end

    assert_redirected_to battle_game_url(BattleGame.last)
  end

  test "should show battle_game" do
    get battle_game_url(@battle_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_battle_game_url(@battle_game)
    assert_response :success
  end

  test "should update battle_game" do
    patch battle_game_url(@battle_game), params: { battle_game: { agility: @battle_game.agility, chi: @battle_game.chi, created_by: @battle_game.created_by, description: @battle_game.description, healing: @battle_game.healing, intelligence: @battle_game.intelligence, loser_experience: @battle_game.loser_experience, magic: @battle_game.magic, name: @battle_game.name, play_for_keeps: @battle_game.play_for_keeps, speed: @battle_game.speed, status: @battle_game.status, strength: @battle_game.strength, updated_by: @battle_game.updated_by, winner_gold: @battle_game.winner_gold, winner_experience: @battle_game.winner_experience, wisdom: @battle_game.wisdom, wit: @battle_game.wit } }
    assert_redirected_to battle_game_url(@battle_game)
  end

  test "should destroy battle_game" do
    assert_difference('BattleGame.count', -1) do
      delete battle_game_url(@battle_game)
    end

    assert_redirected_to battle_games_url
  end
end
