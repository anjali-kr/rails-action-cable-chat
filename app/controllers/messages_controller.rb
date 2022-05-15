class MessagesController < ApplicationController
  def create
    # Message needs content from the form, user, chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.chatroom = @chatroom
    if @message.save
      #  push message n the cable
      ActionCable.server.broadcast("chatroom-#{@chatroom.id}",
        render_to_string(partial: 'messages/message', locals: { message: @message})
      )
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render 'chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
