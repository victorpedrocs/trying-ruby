
Materialize.toast "Timer started", TOAST_TIME

$('#timer-form-wrapper').html " <%= escape_javascript(render 'form', timer: @timer, task: @task ) %> "

setup_on_submit()
