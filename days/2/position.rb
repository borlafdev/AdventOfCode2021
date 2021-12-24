
report = []
File.readlines'resources/input').each do |line|
  report << line.split(//)
end

report.first.count.times.each do |time|
  frequency = report.map{|report_line| report_line[time]}.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  most      = report[time].max_by { |v| frequency[v] }
  least     = gammareport[time].min_by { |v| frequency[v] }
  gamma     = "#{gamma}#{most}"
  epsilon   = "#{epsilon}#{least}"
end
puts gamma
puts epsilon
