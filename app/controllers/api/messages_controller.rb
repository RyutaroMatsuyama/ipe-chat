class Api::MessagesController < ApplicationController

  def index
    last_message = params[:last_message]
    if partner
      @messages = (Message.where('id>?',last_message).where(reciever_id: partner.id, user_id: current_user.id)).or(Message.where('id>?',last_message).where(reciever_id: current_user.id, user_id: partner.id))
      @current_user = current_user.id
    else
      @messages = Message.includes(:user).where('id>?',last_message).where(reciever_id: nil)
      @current_user = current_user.id
    end
  end
end
