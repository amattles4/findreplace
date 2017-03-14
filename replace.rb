def duplicates() #Duplicate procedure
  puts "-- Exclude duplicates from output? y/n"
  answer = gets.chomp
  answer.downcase
    if answer == 'y'
      $answer = 1
      $answer.to_i
    elsif answer == 'n'
      $answer = 0
      $answer.to_i
    else puts "Invalid answer."
    end
end


def purpose() #Purpose procedure
  puts "-- What would you like to scan for? (e.g. \"email\" or \"phone\" or \"custom\")"
  $purpose = gets.chomp
  if $purpose == "custom"
    puts "-- Enter a custom regex:"
    $custom = gets.chomp
  end
end

purpose() #Ask user for purpose of script
duplicates() #Ask user for duplicate procedure

start = Time.now #time operation 1

$count_a = 0
i = 0
Dir.glob("input/*") {|filename| # Rename all files in input directory
  i = i + 1
  file = File.new(filename)
  new_filename = "#{i}.txt"
  $stdout.write "-- Renaming #{filename} to #{new_filename} ... \r"
  sleep(0.005)
  File.rename(filename, new_filename)
  $count_a = $count_a.to_i + 1
}


finish = Time.now #end operation 1
diff = finish - start #compute time of operation 1


puts "\n"
puts "-- Renaming complete." #put done to console
sleep(0.5) #pause effect
puts "-- Replaced #{$count_a} items. Finished in #{diff} seconds." #print time of operation 1
sleep(0.5) #pause effect
puts "-- Finding all matching emails..." #put message to console

start = Time.now #time operation 2

$count_b = 0
$errors = 0 #var to hold the count of errors
Dir.glob("*.txt") {|a| #find all text files
  text = File.read(a)
  var = []

  case $purpose
  when 'email'
  var = text.scan(/[\w\d.+]+@[\w\d]+(?:\.[a-z]{2,4}){1,2}/)
  when 'phone'
  var = text.scan(/^\s*(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\s*$/)
  when nil
    var = text.scan(/'#{$custom.to_str}'/)
  else
  var = text.scan(/[\w\d.+]+@[\w\d]+(?:\.[a-z]{2,4}){1,2}/)
  end

    if var.nil?
        $errors = $errors.to_i + 1
      else
    end
  text = var
  File.open(a, "w") {|file|
    file.write text
  }
  $count_b = $count_b.to_i + 1
}

finish = Time.now #end operation 2
diff = finish - start #compute time of operation 2

if $errors == 1 #List number of not-found errors
  puts "-- Found #{$errors} file with no matches." #singular file
else
  puts "-- Found #{$errors} files with no matches." #plural files
end

sleep(0.5) #pause effect
puts "-- Search for matches complete." #print done to console
sleep(0.5) #pause effect
puts "-- Scanned #{$count_b} items. Finished in #{diff} seconds." #print time of operation 2
sleep(1) #pause effect
puts "-- Writing to new CSV file..." #print message to console

$newfile = [] #instantiate newfile array to hold emails

Dir.glob("*.txt") {|b| #open each file and put lines into newfile array
  email = File.read(b)
  $newfile << email
}

if $answer == 1
$newfile = $newfile.uniq #remove duplicate emails from array
else puts "-- Not eliminating unique values..."
end

$newfile.to_s #convert newfile array into string

File.open('output.csv', 'w') do |output_file|
  # output the string interpolation
  output_file.puts $newfile
end

sleep(0.5) #pause effect

def show_wait_cursor(seconds,fps=10) #create wait cursor function
  chars = %w[| / - \\]
  delay = 1.0/fps
  (seconds*fps).round.times{ |i|
    print chars[i % chars.length]
    sleep delay
    print "\b"
  }
end

def remove_files() #create removal function
  Dir.glob("*.txt") {|c|
    File.delete(c)
  }
end

remove_files() #remove all old files
puts "-- Cleaning up..." #print cleanup to console
show_wait_cursor(2) #show wait cursor
puts "-- SUCCESS!" #print success to console
