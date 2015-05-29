class NotificationsController < ApplicationController
 
  skip_before_filter :verify_authenticity_token
 
  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    if params["From"].nil?
      to = '+19717173952'
    else 
      to = params["From"]
    end
    message = client.messages.create from: '+1 980-365-8326', to: to, body: 'Hello User'
    render plain: message.status
  end
 
end