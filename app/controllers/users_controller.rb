class UsersController < ApplicationController

  def create 
    @user = User.new(user_params)

    if @user.save 
      token = encode_token(user_id: @user.id)
      SendWelcomeEmailJob.perform_in(10.seconds, [@user.id, token]) 
      render json: { token: token, message: 'User created successfully' }, status: :created
    else 
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
   @user = User.find(params[:id])
   render json: @user
  end

 def edit
   @user = User.find(params[:id])
   render json: @user
 end

 def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private 

  def user_params 
   params.require(:user).permit(:user_name, :email, :password_digest)
  end 

  def encode_token(payload)
   JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
