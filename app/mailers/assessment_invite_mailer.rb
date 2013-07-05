class AssessmentInviteMailer < ActionMailer::Base
  default from: "admin@devfiltr.io"
  
  def invite_email(email)
    @url  = 'http://devfiltr.herokuapp.com'
    mail(to: email, subject: 'You will be assessed...')
  end
end
