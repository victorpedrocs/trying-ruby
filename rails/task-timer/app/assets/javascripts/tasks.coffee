# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Clock
  constructor: ->
    @startTime
    @running = false

  convert_time: ( time ) ->
    s = Math.trunc(time / 1000)
    m = Math.trunc( s / 60 )
    h = Math.trunc( m / 60 )

    converted_time =
      hours:   Math.trunc( h % 60 )
      minutes: Math.trunc( m % 60 )
      seconds: Math.trunc( s % 60 )

  cont_time_callback: ->
    this.cont_time()

  cont_time: ->
    elapsed = this.convert_time new Date().getTime() - @startTime
    $('p#notice').text("#{elapsed.hours}:#{elapsed.minutes}:#{elapsed.seconds}")
    setTimeout this.cont_time_callback(), 2000 if @running
    return

  start: ->
    console.log "Timer started:"
    @startTime = new Date().getTime()
    @running = true
    this.cont_time()
    return

  stop: ->
    @running = false
    return

  rec: (n) ->
    if n > 0
      console.log "couting"
      this.rec n-1
    return


$(document).ready(
  ->
    $('select').material_select()
    return
)
