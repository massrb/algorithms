# Given a set of activities with start times and 
# end times, select the maximum number of 
# non-overlapping activities that can be performed by a single person.


def activity_selection(start_times, end_times)
  n = start_times.size
  activities = (0...n).map { |i| [start_times[i], end_times[i]] }

  # Sort by end time
  activities.sort_by! { |activity| activity[1] }

  selected = []
  last_end = -Float::INFINITY

  activities.each do |start, finish|
    if start >= last_end
      selected << [start, finish]
      last_end = finish
    end
  end

  selected
end