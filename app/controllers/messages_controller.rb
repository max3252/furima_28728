class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(text: params[:message][:text], user_id: current_user.id)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message,username: @message.user.nickname
    end
  end
end
