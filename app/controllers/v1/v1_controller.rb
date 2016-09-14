class V1::V1Controller < ActionController::Base
  respond_to :json

  def admin_user_id 
  	current_user.admin_user.id
  end

  def check_admin_permissions
	user = AdminUser.find_by_id(admin_user_id)
	return head(:forbidden) unless user.present? && user.permission == 'admin'
  end
end
