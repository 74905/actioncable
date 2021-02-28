 document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: $('#messages').data('room_id') },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
     if data['id']
      id = ('#') + data['id']
      $(id).remove()
     else
      show_user = $('#show_user').data('show_user')
      if data['chat_user'] == show_user
       $('#chats').append data['chat']
       $('.chat_box').animate scrollTop: $('.chat_box')[0].scrollHeight
      else
       $('#chats').append data['chatother']
       $('.chat_box').animate scrollTop: $('.chat_box')[0].scrollHeight
    destroy: (id) ->
      @perform 'destroy', id: id
    speak: (message) ->
      @perform 'speak', message: message

　$(document).on 'click', '.chat_submit', (event) ->
  App.room.speak $('[data-behavior~=chat_speaker]').val()
  $('[data-behavior~=chat_speaker]').val('')
  event.preventDefault()

 $(document).on 'click', '.delete-btn', (event) ->
  App.room.destroy event.target.id