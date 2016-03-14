

initialize = ->
  $('select').material_select() # Setting up the material select
  setup_on_submit()
  setup_timer()
  toast_notice()
  return


$(document).ready( initialize )
$(document).on('page:load', initialize) # Turbolink on page load
