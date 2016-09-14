require 'test_helper'

class BattlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @battle = battles(:one)
  end

  test "should get index" do
    get battles_url
    assert_response :success
  end

  test "should get new" do
    get new_battle_url
    assert_response :success
  end

  test "should create battle" do
    assert_difference('Battle.count') do
      post battles_url, params: { battle: { : @battle., battle_game_id: @battle.battle_game_id, battled_on: @battle.battled_on, created_by: @battle.created_by, description: @battle.description, is_tie: @battle.is_tie, loser_experience: @battle.loser_experience, name: @battle.name, pet1_id: @battle.pet1_id, pet2_id: @battle.pet2_id, play_for_keeps: @battle.play_for_keeps, updated_by: @battle.updated_by, winner_experience: @battle.winner_experience, winner_gold: @battle.winner_gold, winning_pet_id: @battle.winning_pet_id, winning_user_id: @battle.winning_user_id } }
    end

    assert_redirected_to battle_url(Battle.last)
  end

  test "should show battle" do
    get battle_url(@battle)
    assert_response :success
  end

  test "should get edit" do
    get edit_battle_url(@battle)
    assert_response :success
  end

  test "should update battle" do
    patch battle_url(@battle), params: { battle: { : @battle., battle_game_id: @battle.battle_game_id, battled_on: @battle.battled_on, created_by: @battle.created_by, description: @battle.description, is_tie: @battle.is_tie, loser_experience: @battle.loser_experience, name: @battle.name, pet1_id: @battle.pet1_id, pet2_id: @battle.pet2_id, play_for_keeps: @battle.play_for_keeps, updated_by: @battle.updated_by, winner_experience: @battle.winner_experience, winner_gold: @battle.winner_gold, winning_pet_id: @battle.winning_pet_id, winning_user_id: @battle.winning_user_id } }
    assert_redirected_to battle_url(@battle)
  end

  test "should destroy battle" do
    assert_difference('Battle.count', -1) do
      delete battle_url(@battle)
    end

    assert_redirected_to battles_url
  end
end
