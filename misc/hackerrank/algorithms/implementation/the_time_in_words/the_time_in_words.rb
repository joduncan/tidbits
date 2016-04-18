#!/bin/ruby

def text_time(value)
  text = ""
  while value > 0 do
    text += " " if text.length > 0
    case
    when value == 1
      text += "one"
      decrement = value
    when value == 2
      text += "two"
      decrement = value
    when value == 3
      text += "three"
      decrement = value
    when value == 4
      text += "four"
      decrement = value
    when value == 5
      text += "five"
      decrement = value
    when value == 6
      text += "six"
      decrement = value
    when value == 7
      text += "seven"
      decrement = value
    when value == 8
      text += "eight"
      decrement = value
    when value == 9
      text += "nine"
      decrement = value
    when value == 10
      text += "ten"
      decrement = value
    when value == 11
      text += "eleven"
      decrement = value
    when value == 12
      text += "twelve"
      decrement = value
    when value == 13
      text += "thirteen"
      decrement = value
    when value == 14
      text += "fourteen"
      decrement = value
    when value == 15
      text += "fifteen"
      decrement = value
    when value == 16
      text += "sixteen"
      decrement = value
    when value == 17
      text += "seventeen"
      decrement = value
    when value == 18
      text += "eighteen"
      decrement = value
    when value == 19
      text += "nineteen"
      decrement = value
    when value.between?(20,29)
      text += "twenty"
      decrement = 20
    when value.between?(30,39)
      text += "thirty"
      decrement = 30
    when value.between?(40,49)
      text += "forty"
      decrement = 40
    when value.between?(50,59)
      text += "fifty"
      decrement = 50
    end
    value -= decrement
  end
  return text
end

while !ARGF.eof? do
  hour = ARGF.readline.to_i
  minutes = ARGF.readline.to_i

  case 
  when minutes == 0
    puts text_time(hour) +" o'clock"
  when minutes == 1
    puts text_time(minutes) + " minute past "+text_time(hour)
  when minutes == 15
    puts "quarter past "+text_time(hour)
  when minutes == 30 
    puts "half past "+text_time(hour)
  when minutes == 45
    puts "quarter to "+text_time((hour % 12) + 1)
  when minutes < 30
    puts text_time(minutes) + " minutes past "+text_time(hour)
  when minutes > 30
    puts text_time(60-minutes) + " minutes to "+text_time((hour % 12) + 1)
  end
end

