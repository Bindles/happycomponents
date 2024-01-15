#Faker::Name.unique.name
p myArray = ["js", "ruby", "c"]
p myArray.sample

sharks = ["Hammerhead", "Great White", "Tiger"]
result = sharks.find {|item| item.include?("a")}
p result

p sharks.sort {|a,b| a <=> b}

sharkz = [
  {name: "Hammerhead"},
  {name: "Great white"},
  {name: "Angel"}]

p sharkz.sort {|a,b| a[:name] <=> b[:name]}

new_sharks = sharks
p new_sharks
new_sharks.push("Whale")
p '--'
p (new_sharks + sharks).uniq

p '--'
p new_sharks | sharks
newer_sharks = ["Hammerhead", "Tiger", "Whale"]
p '--'
a = sharks - newer_sharks
p a

numbers = [2,4,6,8]

# square each number
squared_numbers = numbers.map {|number| number * number}

print squared_numbers



options = sharks.map {|shark| "<option>#{shark}</option>"}

p options

output = options.join("\n")
print output


result = 0
[1, 2, 3].each {|num| result += num} and p result
# Output
# 6

output = [1,2,3].reduce(0) {|result, current| result += current }
p output