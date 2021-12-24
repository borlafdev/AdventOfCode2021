
def get_frequency(array, type)
  frequency = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  line      = array
  most      = line.max_by { |v| frequency[v] }
  least     = line.min_by { |v| frequency[v] }
  if most == least
    type == :max  ? '1' : '0'
  else
    type == :max  ? most : least
  end
end

def parse_report(report, type)
  lines = []
  bit = nil
  result = nil
  report.first.count.times.each do |time|
    if bit == nil
      bit = get_frequency(report.map{|report_line| report_line[time]}, type)
      report.map do |line|
        lines << line if line[0] == bit
      end
    else
      bit = get_frequency(lines.map{|report_line| report_line[time]}, type)
      lines = lines.select{|line| line[time] == bit }
      if lines.length == 1
        result = lines[0]
      end
    end
  end
  result
end

report = []
File.readlines('resources/input').each do |line|
  report << ( line.split(//) - ["\n"]  )
end
gamma = parse_report(report, :max)
epsilon = parse_report(report, :min)
puts gamma.join.to_i(2) * epsilon.join.to_i(2)
