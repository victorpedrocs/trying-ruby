
setup_on_submit = ->
  $('form#timer-form').submit (event) ->
    url = $(this).attr('action')
    method = $("form#timer-form input[name='_method']").val()

    if !$('input#time-start').val()
      $('input#time-start').val( new Date() )
    else
      $('input#time-finish').val( new Date() )

    timer_data = {
      start: $('input#time-start').val(),
      finish: $('input#time-finish').val()
    }

    return true
  return

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

setup_timer = ->
  if $('#timer-form').children('input#time-start').val()
    $('i#timer-button').text('stop');
    setInterval set_time, 500
  return

toast_notice = ->
  notice = $('input#notice').val()
  if notice != ''
    Materialize.toast(notice, 4000)

  return

initialize = ->
  # Setting up the material select
  $('select').material_select()
  setup_on_submit()
  setup_timer()
  toast_notice()

  return


$(document).ready( initialize )
# Work around turbolinks
$(document).on('page:load', initialize)


# Turbolinks latency loader indicator
# $(document).on('page:fetch', callback) # is the event fired when the page is loading
# $(document).on('page:change', callback) # is fired when the page finishes loading
