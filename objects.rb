############
#   Objects
############

class Animal
    def def initialize
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
