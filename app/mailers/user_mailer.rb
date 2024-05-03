class UserMailer < ApplicationMailer
  def welcome_email(user, token)
    @user = user
    @token = token
     @user_id = @user.id
    mail(to: 'epvishwas123@gmail.com', subject: "Welcome to Sign Up")
  end
end
