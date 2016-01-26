array1 = Array.new
array2 = Array.new(5)
array3 = Array.new(5, "empty")
array4 = [1, "two", 3, 5.5]

puts array1
puts array2
puts array3
puts array4

puts ""
puts array4[2,2].join(", ")
puts array4.values_at(0,1,3).join(", ")
array4.unshift(0)
array4.push(100, 200)
array4.pop
puts array4.join(", ")
array4.concat([10,20,30])
puts "Array size: " + array4.size().to_s
p array4
sum = 0
array4.each do |value|
	sum += value if value.class == Fixnum
end
puts "The sum of array4 is: " + sum.to_s

############
# Hashes
############
number_hash = {	"PI" => 3.14,
						"Golden" => 1.618,
						"e" => 2.718}
puts number_hash["PI"]

puts "\n\nYou can set a default value for a hash in the initialization"
default_hash = Hash.new("No key found")
puts default_hash["key"]

puts "\n\nYou can update a hash with update, but if there are matching keys, they will be replaced"
default_hash = Hash["one", 1,
		"two", 2,
		"three", 3,
		"four", 4]
number_hash.update(default_hash)
p number_hash

puts "To keep the old values you can use merge instead of update"
new_hash = Hash["ten", 10,
							"eleven", 11,
							"two", 12,
							"three", 13]

number_hash.merge(new_hash)

number_hash.each do |key, value|
	puts "#{key}\t: #{value}"
end


puts "\n\nAnd you have the default methods of hash:"
puts "Has key [\"two\"]:\t" + number_hash.has_key?("two").to_s
puts "Has value 20:\t\t" + number_hash.has_value?(20).to_s
puts "Is empty?\t\t" + number_hash.empty?.to_s
puts "Size:\t\t\t" + number_hash.size.to_s

puts "\nAnd, of course, you can delete a key:"
puts "delete \"three\" \n "
number_hash.delete("three")
number_hash.each do |key, value|
	puts "#{key}\t: #{value}"
end
