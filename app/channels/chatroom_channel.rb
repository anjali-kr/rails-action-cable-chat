class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # Gets called as sonn as there is a subscription made from a client
    stream_from "chatroom-#{params[:id]}"
  end

  # def subscribed
  #   chatroom = Chatroom.find(params[:id])
  #   stream_for chatroom
  # end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
