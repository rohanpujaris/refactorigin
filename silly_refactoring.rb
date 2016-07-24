# Original code
puts 'Batsmen' if !bowler?

# Refactored code
puts 'Batsmen' unless bowler?
bowler? or puts 'Batsmen'

#Original code
puts "Hi"

# Refactored code
puts 'Hi'