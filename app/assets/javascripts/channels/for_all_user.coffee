App.chat = App.cable.subscriptions.create {
  channel: "ForAllUserChannel"
},
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    alert data['message']

  send_message: (message) ->
    @perform 'send_message', message: message

