class SupportMailer < ActionMailer::Base
  default from: "test_user@example.com"

  def notify_bug
    mail(
      from: 'uday <test_mailer@example.com>',
      to: 'lammatha1987@gmail.com',
      subject: 'I found bug in your application'
      )
  end

end
