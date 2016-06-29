$(document).ready ->
  App.chat = App.cable.subscriptions.create {
    channel: "ForAllUserChannel"
  },
    connected: ->
  # Called when the subscription is ready for use on the server

    disconnected: ->
  # Called when the subscription has been terminated by the server

    received: (data) ->
      if data['type'] == 'message'
        $('#message_field').append data['message']
      else
        $('#user_field').append data['message']

    send_message: (data) ->
      @perform 'send_message', message: data['message'], to_user_id: data['to_user_id']

