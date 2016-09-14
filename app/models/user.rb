class User < ApplicationRecord
 after_create :create_account

  has_one :admin_user

    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def create_account
      AdminUser.create(username:"Unknown Arena Master", user_id:id, created_by:id, updated_by:id, permission:'user', status:'active') 
  end
end
