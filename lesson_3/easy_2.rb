#1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.key?("Spot") #can also use include? or member?

#2
munsters_description = "The Munsters are creepy in a good way."

munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!

#3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

#4
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match?("Dino")

#5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones << "Dino"

#7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push("Dino", "Hoppy")

#8 Don't understand this yet
advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, advice.index('house'))

#9
statement = "The Flintstones Rock!"

p statement.count('t')

#10
title = "Flintstone Family Members"

p title.center(40)
