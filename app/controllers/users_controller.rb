class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, :notice => "Signed up! Please Log in to continue...!"
    else
      render "new"
    end
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        session[:user_id] = @user.id
        format.html { redirect_to cities_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: cities_path }
      else
        @user.destroy
        format.html { redirect_to new_session_path, notice: 'User was already found' }
        format.json { render :show, status: :ok, location: new_session_path }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to new_session_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      if @user.nil?
        redirect_to new_session_path, alert:'insuficient credentials'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:password,:name,:uid,:provider,:oauth_token,:oauth_expires_at)
    end
end
