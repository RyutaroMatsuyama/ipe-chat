class Api::MessagesController < ApplicationController
  def index
    last_message = params[:last_message]
    if params[:user_id]
      partner_id = params[:user_id]
      @messages = Message.where('id>?',last_message).where(reciever_id:current_user.id).where(user_id:partner_id)
      @current_user = current_user.id
    else
      @messages = Message.includes(:user).where('id>?',last_message).where(reciever_id: nil)
      @current_user = current_user.id
    end
  end
end
