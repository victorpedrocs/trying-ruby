require 'time_diff'

module TasksHelper

  def delta_time ( start, finish )
    Time.diff( start, finish, '%h:%m:%s' )[:diff]
  end

end
