class V1::AdminUsersController < V1::V1Controller
  before_action :authenticate_user!
  before_action :check_admin_permissions
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /accounts/me.json
  def me
    return head(:unauthorized) unless current_user.present?
    @admin_user = AdminUser.find_by_id(admin_user_id)
    return head(:not_found) unless @admin_user.present?

    respond_with @admin_user
  end

  def index
    @admin_users = AdminUser.all
    respond_with @admin_users
  end

  def show
    respond_with @admin_user
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)

    @admin_user.updated_by = admin_user_id
    @admin_user.created_by = admin_user_id

    return head(:internal_server_error) unless @admin_user.save

    respond_with @admin_user

  end

  def update
    @admin_user.updated_by = admin_user_id
    return head(:internal_server_error) unless @admin_user.update(admin_user_params)    

    respond_with @admin_user
  end

  private
    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    def admin_user_params
      params.permit(:username, :permission, :status)
    end
end
