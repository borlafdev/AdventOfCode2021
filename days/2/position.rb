horizontal_position = 0
depth               = 0
aim                 = 0
File.readlines('resources/input').each do |step|
  step_sections = step.split(' ')
  direction     = step_sections[0]
  amount        = step_sections[1].to_i
  case direction
  when 'forward'
    horizontal_position += amount
    depth               += aim * amount
  when 'up'
    aim -= amount
  when 'down'
    aim += amount
  end
end
puts horizontal_position * depth
