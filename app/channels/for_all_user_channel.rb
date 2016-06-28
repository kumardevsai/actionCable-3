# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ForAllUserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "for_user_#{current_user.id}_channel"
    stream_from "for_all_user_channel"
    a=ApplicationController.render partial: 'welcome/user', locals: {user:current_user}
    ActionCable.server.broadcast "for_all_user_channel", message: a
  end

  def unsubscribed
#    a=ApplicationController.render partial: 'welcome/user', locals: {user:current_user}
#    ActionCable.server.broadcast "for_all_user_#{current_user.id}_channel", message: a
  end

  def send_message(data)
    a= ApplicationController.render partial: 'welcome/message', locals: {message: data['message']}
    ActionCable.server.broadcast "for_user_#{current_user.id}_channel", message: a,type: 'message'
  end
end
