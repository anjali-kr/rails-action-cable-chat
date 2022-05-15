class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    # @messages = Message.where(chatroom: @chatroom)
    @message = Message.new
  end
end
