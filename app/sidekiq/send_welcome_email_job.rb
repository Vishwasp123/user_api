class SendWelcomeEmailJob
  include Sidekiq::Job
  
  def perform(args)
    user_id, token = args 
    @user = User.find(user_id)
    UserMailer.welcome_email(@user, token).deliver_now
  end
end
