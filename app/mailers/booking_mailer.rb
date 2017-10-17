class BookingMailer < ApplicationMailer
  def booking_notification(recipient, subject, message)
    @from_email = ENV.fetch('CONFIRMATION_EMAIL')
    @message = message
    mail(to: recipient, subject: subject)
  end
end
