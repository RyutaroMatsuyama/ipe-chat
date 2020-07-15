class Api::MessagesController < ApplicationController

  def index
    last_message = params[:last_message]
    @messages = Message.includes(:user).where('id>?',last_message)
    @current_user = current_user.id
  end
end
