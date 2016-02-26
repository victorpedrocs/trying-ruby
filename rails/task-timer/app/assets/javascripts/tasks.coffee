
on_submit_timer_form = ( action ) ->
  d = new Date()
  $('input#time-'+action).val(d)
  return true

setup_on_submit = ->
  if $('#form-timer-start').length
    $('form#form-timer-start').submit( ->
      d = new Date()
      $('input#time-start').val(d)
      return true
    )

  if $('#form-timer-stop').length
    $('form#form-timer-stop').submit( ->
      d = new Date()
      $('input#time-stop').val(d)
      return true
    )
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
  if $('#form-timer-stop').length
    setInterval set_time, 500
  return

toast_notice = ->
  notice = $('input#notice').val()
  if notice != ''
    Materialize.toast(notice, 4000)

  return

$(document).ready(
  ->
    # Setting up the material select
    $('select').material_select()
    setup_on_submit()
    setup_timer()
    toast_notice()

    return
)
