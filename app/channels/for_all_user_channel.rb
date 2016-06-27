# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ForAllUserChannel < ApplicationCable::Channel
  def subscribed
     stream_from "for_all_user_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send(data)
    ActionCable.server.broadcast 'for_all_user_channel', data: data['message']
  end
end
