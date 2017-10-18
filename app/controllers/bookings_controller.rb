class BookingsController < ApplicationController
  
  def create
    # Extract values from submitted form
    booking_params = params.require(:booking).permit(:check_in_at, :check_out_at, :guest_count, :listing_id)
    @listing = Listing.find(booking_params[:listing_id])
    # Create booking model with these values
    @new_booking = Booking.new(booking_params)
    @new_booking.guest_id = current_user.id

    if @new_booking.save
      # Contains the message for the guest
      message_to_guest = "You successfully booked #{@listing.title} from #{@new_booking.check_in_at} to #{@new_booking.check_out_at} for #{@new_booking.guest_count} #{"guest".pluralize @new_booking.guest_count}" 
      # Contains the message for the host
      message_to_host = "#{current_user.profile.first_name} #{current_user.profile.last_name} booked #{@listing.title} from #{@new_booking.check_in_at} to #{@new_booking.check_out_at} for #{@new_booking.guest_count} #{"guest".pluralize @new_booking.guest_count}"

      # Send notification of successful booking to guest
      send_notification("#{ENV['MY_MOBILE']}", message_to_guest )
      # Send notification to host 
      send_notification("#{ENV['MY_MOBILE']}", message_to_host)

      # Send email notification to guest
      BookingMailer.booking_notification(current_user.email, message_to_guest).deliver_now
      # Send email notification to host
      BookingMailer.booking_notification(@listing.host.email, message_to_host).deliver_now
      render :success
    else
      render 'listings/show'
    end
  end

  private 

  def send_notification(recipient_number, body)
    account_sid = ENV['TWILIO_SSID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: body,
        to: recipient_number,    
        from: "#{ENV['TWILIO_NUMBER']}")  
  end
end