class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /users
  # GET /users.json
  def index
    @users = User.order(sort_column + " " + sort_direction).page(params[:page])
    @referrals = User.sum("count") 
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.csv { send_data @users.to_csv }
      format.xls # { send_data @users.to_csv(col_sep: "\t") }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @user.code = params[:code]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @find = User.where("email = ?", @user.email).first
      @user = @find
      redirect_to @user
    else
      if (@user.code and @referral = User.where("code = ?", params[:user][:code]).first ) 
       @referral.update_count
      end
      @user.generate_code
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

    end 
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
