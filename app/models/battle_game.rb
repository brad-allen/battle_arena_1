class BattleGame < ApplicationRecord
	
  validates :status, presence: true, length: { maximum: 25 }
  validates :strength, presence: true, numericality: { only_decimal: true }
  validates :agility, presence: true, numericality: { only_decimal: true }
  validates :wit, presence: true, numericality: { only_decimal: true }
  validates :speed, presence: true, numericality: { only_decimal: true }
  validates :wisdom, presence: true, numericality: { only_decimal: true }
  validates :intelligence, presence: true, numericality: { only_decimal: true }
  validates :magic, presence: true, numericality: { only_decimal: true }
  validates :chi, presence: true, numericality: { only_decimal: true }
  validates :healing, presence: true, numericality: { only_decimal: true }

end
