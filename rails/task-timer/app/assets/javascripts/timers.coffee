timer_interval = null

disable_timer_button = ->
  $("#timer-button").addClass("disabled").prop "disabled", true

enable_timer_button = ->
  $("#timer-button").removeClass("disabled").prop "disabled", true

get_start_time = ->
  $('#time-start').val()

diff_time = ( start ) ->
  now = new Date()
  moment.utc( moment( now ).diff( moment( start ) ) ).format( 'HH:mm:ss' )

set_time = ->
  begin = new Date( get_start_time() )
  delta = diff_time( begin )
  $('input#time-finish').val( new Date() )
  $('#timer').html( delta )
  return

window.start_timer = ->
  $('i#timer-button-icon').text 'stop'
  $('#card-timer').fadeIn()
  timer_interval = setInterval set_time, 500
  return

window.stop_timer = ->
  clearInterval timer_interval
  $('#card-timer').fadeOut()
  $('i#timer-button-icon').text 'play_arrow'
  return

window.setup_timer = ->
  $form = $('#timer-form')
  $time_start = $form.children('input#time-start')
  $time_finish = $form.children('input#time-finish')

  if $time_start.val() and !$time_finish.val()
    start_timer()
  else if $time_finish.val()
    stop_timer()
  else
    $('#card-timer').hide()
  return

on_destroy_timer = ( timer_id ) ->
  $("##{timer_id}").fadeOut()
  Materialize.toast "Timer deleted", TOAST_TIME

encerrar_timer = (form, data) ->
  Materialize.toast "Timer finished", TOAST_TIME

iniciar_novo_timer = (form, data) ->
  action = $(form).attr('action')
  $method = $(form).children("input[name='_method']")
  if $method[0]
    $method.val('patch')
  else
    $(form).append '<input type="hidden" name="_method" value="patch">'
  Materialize.toast "Timer iniciado", TOAST_TIME


window.setup_on_submit = ->
  $('#timer-form')
    .on "ajax:before", (event) ->
      $time_start = $('input#time-start')
      $time_finish = $('input#time-finish')

      if !$time_start.val() and !$time_finish.val()
        $time_start.val new Date()
        disable_timer_button()
        setup_timer()
        return
      else
        disable_timer_button()
        setup_timer()
        return

    .on "ajax:error", ( event, xhr, status, error ) ->
      Materialize.toast "Ocorreu um erro #{error}", TOAST_TIME
      return

  return
