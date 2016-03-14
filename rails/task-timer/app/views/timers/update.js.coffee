
$('#timers-card').append ' <%= escape_javascript(render @timer) %>'

$('#timer-form-wrapper').html " <%= escape_javascript(render 'form', timer: @task.timers.build, task: @task ) %> "
Materialize.toast "Timer finished", TOAST_TIME

setup_on_submit()
