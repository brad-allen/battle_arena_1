class AdminUser < ApplicationRecord
  belongs_to :user

  validates :permission, presence: true, length: { maximum: 25 }, inclusion: { in: %w(user admin), message: "Permission is not valid" }, allow_nil: false
  validates :status, presence: true, length: { maximum: 25 }, inclusion: { in: %w(active locked removed), message: "Status is not valid" }, allow_nil: false
  validates :user_id, presence: true, numericality: { only_integer: true }

end
