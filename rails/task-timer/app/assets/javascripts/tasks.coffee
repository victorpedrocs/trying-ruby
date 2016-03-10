get_timer_html = (timer) ->
  start = new Date( timer.start )
  finish = new Date( timer.finish )
  interval = moment.utc( moment( finish ).diff( moment( start ) ) ).format( 'HH:mm:ss' )
  "<div class='row'>
    <div class='col s3'>
      #{timer.start}
    </div>
    <div class='col s3'>
      #{timer.finish}
    </div>
    <div class='col s3'>
      #{interval}
    </div>
    <div class='col s3'>
      <a class='destroy-timer' data-remote='true' rel='nofollow' data-method='delete' href='/tasks/#{timer.task_id}/timers/#{timer.id}'><i class='material-icons'>delete</i></a>
    </div>
   </div>"

get_start_time = ->
  $('#time-start').val()

diff_time = ( start ) ->
  now = new Date()
  moment.utc( moment( now ).diff( moment( start ) ) ).format( 'HH:mm:ss' )

set_time = ->
  begin = new Date( get_start_time() )
  delta = diff_time( begin )

  $('#timer').html( delta )
  return

setup_timer = ()->
  timer_interval = null
  $form = $('#timer-form')
  $time_start = $form.children('input#time-start')
  $time_finish = $form.children('input#time-finish')
  $card_timer = $('#card-timer')

  if $time_start.val() and !$time_finish.val()
    $('i#timer-button').text 'stop'
    $card_timer.fadeIn()
    timer_interval = setInterval set_time, 500
  else if $time_finish.val()
    clearInterval timer_interval
    $card_timer.fadeOut()
    $('i#timer-button').text 'play_arrow'
    reset_form $form[0]
  else
    $card_timer.hide()

  return

setup_destroy_timer = ->
  $('a.destroy-timer')
    .on "ajax:before", (event) ->
      console.log "DESTROY"
    .on "ajax:success", ( event, data, status, xhr ) ->
      $($(this).parents('.row')[0]).fadeOut()
      Materialize.toast "Timer successfully deleted"
    .on "ajax:error", ( event, data, status, xhr ) ->
      Materialize.toast "Ocorreu um errro #{error}"

toast_notice = ->
  notice = $('input#notice').val()
  if notice != ''
    Materialize.toast(notice, 4000)

  return

encerrar_timer = (form, data) ->
  $('#timers-card').append get_timer_html( data )
  $(form).attr('action', "#{window.location.pathname}/timers")
  Materialize.toast "Timer encerrado"

iniciar_novo_timer = (form, data) ->
  action = $(form).attr('action')
  $(form).attr('action', "#{action}/#{data.id}")
  $method = $(form).children("input[name='_method']")
  if $method[0]
    $method.val('patch')
  else
    $(form).append('<input type="hidden" name="_method" value="patch">')
    setup_destroy_timer()

  Materialize.toast "Timer iniciado"


setup_on_submit = ->

  $('form#timer-form')

    .on "ajax:before", (event) ->
      $time_start = $('input#time-start')
      $time_finish = $('input#time-finish')

      if !$time_start.val()
        $time_start.val( new Date() )
        setup_timer()

      else if !$time_finish.val()
        $time_finish.val( new Date() )

    .on "ajax:success", ( event, data, status, xhr ) ->
      if data.finish
        encerrar_timer this, data
      else
        iniciar_novo_timer this, data

      setup_timer()

    .on "ajax:error", ( event, xhr, status, error ) ->
      Materialize.toast "Ocorreu um erro #{error}"


  return

initialize = ->
  $('select').material_select() # Setting up the material select
  setup_on_submit()
  setup_timer()
  toast_notice()
  setup_destroy_timer()
  return


$(document).ready( initialize )
$(document).on('page:load', initialize) # Turbolink on page load
