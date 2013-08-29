class LockController < ApplicationController
	def unlock
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.csv { send_data @users.to_csv }
    end
  end

end