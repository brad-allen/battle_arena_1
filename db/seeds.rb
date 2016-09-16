# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

user1 = User.create!({email: 'admin@battle.com', current_sign_in_at: DateTime.now.new_offset(0), current_sign_in_ip: '127.0.0.1', password:'Test1234!', encrypted_password: '$2a$11$3erLW.rivEkOhLaLUb7myuZhHsJBnbAHC9nprWYEfaEyZUD1B9oMu'}) 
admin_user1 = AdminUser.find_by(user_id:user1.id)
admin_user1.permission = 'admin'
admin_user1.save

user2 = User.create!({email: 'admin2@battle.com', current_sign_in_at: DateTime.now.new_offset(0), current_sign_in_ip: '127.0.0.1', password:'Test1234!', encrypted_password: '$2a$11$3erLW.rivEkOhLaLUb7myuZhHsJBnbAHC9nprWYEfaEyZUD1B9oMu'}) 

admin_user2 = AdminUser.find_by(user_id:user2.id)
admin_user2.permission = 'admin'
admin_user2.save

battle_game1 = BattleGame.create!({name: 'Battle Pets Battle', description:'Default battle', strength:1.4,  agility:1.2, wit:0.2, speed:1.5, wisdom:1.1, intelligence:1.2, magic:1.3, chi:1.1, healing:1, status:'active', winner_gold: 25, winner_experience: 100, loser_experience: 10, updated_by:admin_user1.id, created_by:admin_user1.id})

battle_game2 = BattleGame.create!({name: 'Feat of Strength', description:'You better be strong for this one', strength:3,  agility:0.5, wit:0, speed:1.3, wisdom:0.3, intelligence:0.4, magic:0, chi:1.1, healing:0, status:'active', winner_gold: 100, winner_experience: 100, loser_experience: 25, updated_by:admin_user1.id, created_by:admin_user1.id})

battle_game3 = BattleGame.create!({name: 'Speed Devils', description:'Only the fastest survive', strength:1.4,  agility:1.2, wit:0.8, speed:6.5, wisdom:1, intelligence:1, magic:0.3, chi:0.5, healing:0.4, status:'active', winner_gold: 50, winner_experience: 50, loser_experience: 10, updated_by:admin_user1.id, created_by:admin_user1.id})