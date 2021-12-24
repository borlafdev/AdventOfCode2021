depth_measurements_increases  = 0
last_depth_measurement_window = []
last_depth_measurement_sum    = 0

File.readlines('resources/input').each do |line|
  last_depth_measurement_window << line.to_i
  case last_depth_measurement_window.length
  when 3
    last_depth_measurement_sum = last_depth_measurement_window.inject(0, :+)
  when 4
    last_item        = last_depth_measurement_window.shift
    new_window_count = last_depth_measurement_window.inject(0, :+)
    if last_depth_measurement_sum < new_window_count
      depth_measurements_increases += 1
    end
    last_depth_measurement_sum = new_window_count
  end
end
puts depth_measurements_increases
