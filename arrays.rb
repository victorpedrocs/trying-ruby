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
