class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :load_admin_user_information


  def load_admin_user_information 
  	@admin_user = current_user.admin_user if current_user.present? && current_user.admin_user.present?
  end

  def admin_user_id 
  	current_user.admin_user.id
  end

  def check_admin_permissions
	user = AdminUser.find_by_id(admin_user_id)
	return head(:forbidden) unless user.present? && user.permission == 'admin'
  end
end
