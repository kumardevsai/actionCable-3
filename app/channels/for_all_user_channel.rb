# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ForAllUserChannel < ApplicationCable::Channel
  def subscribed
     stream_from "for_all_user_#{current_user.id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    a=data['message']
    ActionCable.server.broadcast "for_all_user_#{current_user.id}_channel", message: data['message']
  end
end
