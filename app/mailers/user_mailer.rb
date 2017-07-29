class UserMailer < ApplicationMailer
  default from: 'drillz@codecore.ca'

  def registration_pending_email(user)
    @user = user
    @url  = 'http://drillz.codecore.ca/'
    mail(to: @user.email, subject: 'Code Drillz Registration Pending Approval')
  end
end
