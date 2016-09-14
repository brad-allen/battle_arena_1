class HomeController < ApplicationController

  #can only get here if authorized right now...
  def index
  	
    if @admin_user.present? && @admin_user.id.present?  && @admin_user.id > 0
      	respond_to do |format|
        	format.html { render :index, status: :ok, location: @admin_user }
        	format.json { render :index, status: :ok, location: @admin_user }
      	end
   	end
  end
end
