module ProjectsHelper
  def project_time_in_words( project )
    distance_of_time_in_words( 0.seconds, project.get_total_time_spent ).humanize
  end
end
