class Menu
	include Enumerable

	def each
		yield "pizza"
		yield "spaghetti"
		yield "salad"
		yield "water"
		yield "bread"
	end
end

menu_options = Menu.new

menu_options.each do |item|
	puts "Would you like #{item}?"
end

puts "On a Enumerable you can find, select and reject elements"
p menu_options.find{|item| item = "pizza"}
p menu_options.select{|item| item.size < 6}
p menu_options.reject{|item| item.size < 6}

puts "\n\nYou can select elements with number too, like:"
p menu_options.first
p menu_options.take(2)
p menu_options.drop(2)
p menu_options.min
p menu_options.max
p menu_options.sort
menu_options.reverse_each{|item| print item + "; "}
