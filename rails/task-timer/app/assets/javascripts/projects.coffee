
initialize = ->
  $('select').material_select()
  
$(document).ready( initialize )
# Work around turbolinks
$(document).on('page:load', initialize)
