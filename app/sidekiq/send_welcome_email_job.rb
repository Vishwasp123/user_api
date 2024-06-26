class SendWelcomeEmailJob
  include Sidekiq::Job
  
  def perform(args)
    user_id, token = args
    @user = User.find(user_id)
    if @user.email.present?
      UserMailer.welcome_email(@user, token).deliver_now
    else
      Rails.logger.warn("User email is blank for user ID: #{user_id}")
    end
  end
end


