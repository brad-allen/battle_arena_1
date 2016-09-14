class AdminUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_permissions
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  def index
    @admin_users = AdminUser.all
  end

  def show
  end

  def new
    @admin_user = AdminUser.new
  end

  def edit
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)

    respond_to do |format|
      @admin_user.updated_by = admin_user_id
      @admin_user.created_by = admin_user_id
      if @admin_user.save
        format.html { redirect_to @admin_user, notice: 'Admin user was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @admin_user.updated_by = admin_user_id
      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: 'Admin user was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    def admin_user_params
      params.require(:admin_user).permit(:username, :permission, :status)
    end
end
