class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://99cats.com/login'
    mail(to: user.email, subject: 'Welcome to my site!')
  end
end
