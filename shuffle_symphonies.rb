#!/usr/bin/env ruby

numbers = (1..9).to_a.reject { |n| ARGV.include? n.to_s }

numbers.shuffle.each do |i|
  puts "Playing Symphony No. #{i}"
  osacommand = <<-COMMAND
    tell application "iTunes"
      play user playlist "Symphony #{i}"
      delay 1
      repeat until player state is stopped
        delay 1
      end repeat
    end tell
  COMMAND

  `osascript -e '#{osacommand}'`
end
