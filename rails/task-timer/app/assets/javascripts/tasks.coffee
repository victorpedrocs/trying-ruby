
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

set_time = ->
  now = new Date()
  begin = new Date( get_start_time() )
  delta = new Date( now - begin )

  console.log now
  console.log begin
  console.log delta

  $('#timer').html( delta.toLocaleTimeString() )
  return

setup_timer = ->
  if $('#form-timer-stop').length
    setInterval set_time, 500
  return

$(document).ready(
  ->
    # Setting up the material select
    $('select').material_select()
    setup_on_submit()
    setup_timer()

    return
)
