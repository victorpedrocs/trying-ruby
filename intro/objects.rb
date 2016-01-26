require_relative "modules/human"
require_relative "modules/smart"
############
#   Objects
############

class Animal
	def def
		puts "Creating a New Animal"
	end

	def set_name(new_name)
		@name = new_name
	end

	def get_name
		@name
	end

	def name
		@name
	end

	def name=(new_name)
		if new_name.is_a?(Numeric)
	   	puts "Name can't be a number"
		else
	      @name = new_name
	  end
	end

	def is_animal?
		true
	end
end

cat = Animal.new

cat.set_name("Ruby")
puts cat.get_name
puts cat.name
cat.name = "Bichano"
puts cat.name
puts cat.is_animal?


###########

class Dog
   # generates automatically getters...
   attr_reader :name, :height, :weight
   # ... setters ...
   attr_writer :name, :height, :weight
   # ... or both.
   attr_accessor :surname, :familly
	def bark
   	return "Au Au!"
   end
end

rover = Dog.new
rover.name = "Rover"
puts rover.name

class Beagle < Dog
	def bark
		return "Au Au Auuu!"
	end
end

max = Beagle.new
max.name = "Max"
puts "#{max.name} barks #{max.bark}"

############
# 	Modules
############
module Animal_M
	def make_sound
		puts "GRrrrrr"
	end
end

class Wolf
	include Animal_M
end

ghost = Wolf.new
ghost.make_sound

class Scientist
	include Human # include the funcionalities inside, but can be overriten
	prepend Smart # include and override funcionalities

	def act_smart
		return "I don't know"
	end
end

einstein = Scientist.new
einstein.name = "Albert"
puts einstein.name
einstein.run
puts einstein.act_smart



################
# Polymorphism
################

class Bird
	def tweet(bird_type)
		bird_type.tweet
	end
end

class Cardinal < Bird
	def tweet
		puts "tweet twee"
	end
end

class Parrot < Bird
	def tweet
		puts "My name is mario"
	end
end


generic_bird = Bird.new
generic_bird.tweet(Cardinal.new)
generic_bird.tweet(Parrot.new)

############
# Symbols
############
:derek
puts :derek
puts :derek.to_s
puts :derek.class
puts :derek.object_id
