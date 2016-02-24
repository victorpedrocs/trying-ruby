# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Clock
  constructor: ->
    @startTime = new Date()
    @running = false

  # convert_time: ( time ) ->
  #   s = Math.trunc(time / 1000)
  #   m = Math.trunc( s / 60 )
  #   h = Math.trunc( m / 60 )
  #
  #   converted_time =
  #     hours:   Math.trunc( h % 60 )
  #     minutes: Math.trunc( m % 60 )
  #     seconds: Math.trunc( s % 60 )

  # cont_time_callback: ->
  #   this.cont_time()

  # cont_time: ->
  #   elapsed = this.convert_time new Date().getTime() - @startTime
  #   $('p#notice').text("#{elapsed.hours}:#{elapsed.minutes}:#{elapsed.seconds}")
  #   setTimeout this.cont_time_callback(), 2000 if @running
  #   return

  start: ->
    @startTime = new Date()
    $('#timer').html( @startTime.toLocaleTimeString() )
    return

  # stop: ->
  #   @running = false
  #   return

  # rec: (n) ->
  #   if n > 0
  #     console.log "couting"
  #     this.rec n-1
  #   return

on_submit_timer_form = ( action ) ->
  d = new Date()
  $('input#time-'+action).val(d)
  return true

set_time = ( action ) ->
  d = new Date()
  $('#timer').html( d.toLocaleTimeString() )
  return

setInterval set_time(), 1000

$(document).ready(
  ->
    $('select').material_select()
    $('form#form-timer-start').submit(on_submit_timer_form('start'))
    $('form#form-timer-stop').submit(on_submit_timer_form('stop'))
    setInterval set_time, 1000
    return
)
