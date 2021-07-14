class ResetMailer < Devise::Mailer
  default from: 'my_email@gmail.com'

  def reset_password_instructions(record, token, opts = {})
    super
  end
end
