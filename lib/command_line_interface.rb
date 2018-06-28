def welcome
  # puts out a welcome message here!
  puts "Welcome to my app!"
  puts "+++++++++++++++++++++++++++++++"
end

def get_character_from_user

  puts "please enter a character"
  input = gets.chomp
  puts "Movies with #{input}:"
  puts "+++++++++++++++++++++++++++++++"
  input
  # use gets to capture the user's input. This method should return that input, downcased.
end
