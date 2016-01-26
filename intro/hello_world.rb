print "Hello World\n"

print "Enter a Value: "

first_number = gets.to_i

print "Enter Another value: "

second_number = gets.to_i

puts first_number.to_s + " + " + second_number.to_s + " = " + (first_number + second_number).to_s


# Arithmetic operations
# On Ruby
puts "6 + 4 = " + (6+4).to_s
puts "6 - 4 = " + (6-4).to_s
puts "6 * 4 = " + (6*4).to_s
puts "6 / 4 = " + (6/4).to_s
puts "6 % 4 = " + (6%4).to_s

# Ruby has a 14 digits of accuracy on floats
puts "\n\nRuby has a 14 digit accuracy for floats:"
float_one = 1.0
float_99  = 0.999
puts float_one.to_s + " - " + float_99.to_s + " = " + (float_one - float_99).to_s

###################
puts "\n\nIn Ruby, everything is an object:"
print "1.class --> "
puts 1.class
print "1.987.class --> "
puts 1.987.class
print "\"A String\".class --> "
puts "A String".class

##########
puts "\n\nConstants can be updated but they throw a warning"
A_CONSTANT = 1.2
puts "A_CONSTANT = " + A_CONSTANT.to_s
A_CONSTANT = 1.3
puts "A_CONSTANT = " + A_CONSTANT.to_s

=begin
    Multiline Comment
    make no sense
=end
puts "\n\nEnter your age:"
age = gets.to_i
if (age >= 5) && (age <=6)
    puts "Voce está no jardim de infancia"
elsif (age>=7) && ( age <=13 )
    puts "Voce é criança"
    puts "IEIE"
elsif (age >= 14) && ( age <= 21)
    puts "Voce ainda nao pode ir a lugar nenhum"
else
    puts "FREEDOM"
end


puts "\n\nVoce pode comparar numeros usando um comparador lógico"
puts "<=>, -1 se o primeiro é menor, 0 se são iguais e 1 se o primeiro é maior:"
puts " 5 <=> 10 = " + (5 <=> 10).to_s
puts " 5 <=> 5 = " + (5 <=> 5).to_s
puts " 5 <=> 1 = " + (5 <=> 1).to_s

puts "\n\nO Comparador unless é como se fosse um if not"
unless age > 18
    puts "Vai pra escola"
else
    puts "Já passou dessa fase"
end

puts "Um condicional pode ser colocar depois do comando para dizer se ele deve ser executado"
puts "Você é menor de idade" if age < 18

# O comando chomp corta o simbolo de nova linha depois da stirng
puts "\n\nE não pode faltar o switch:"
print "Enter greeting: "
greeting = gets.chomp
case greeting
when "french"
    puts "Bonjour"
    # exit
when "portuguese"
    puts "Olá"
    # exit
when "english"
    puts "Hello"
    # exit
# finally
else
    puts "I didn't understand"
end

puts "\n\nRuby também tem o comparador ternario"
puts (age < 50) ? "Young" : "Old"

##############
#   LOOPS
##############
puts "\n\nThe first is loop do"
x = 1
loop do
    x += 1
    next unless (x % 2) == 0
    print x.to_s
    break if x >= 50
    print " "
end

puts "\n\nThere is the while too"
y = 1
while y <= 50
    y += 1
    print y.to_s + " " if ( y % 2 ) == 0
end

puts "\n\nThere is the until loop"
z = 1
until z >= 50
    z += 1
    print z.to_s + " " if ( z % 2 ) == 0
end

puts "\n\nAnd, of course, the for loop"
numbers = [0,1,2,3,4,5,6,7,8,9]

for number in numbers
    # and you can put valus inside the string
    print "#{number} " if ( number % 2 ) == 0
end

puts "\n\nBut the most cool of all is the each"
(0..10).each do |i|
    puts "\##{i}"
end


#############
#   Strings
#############

multiline_string = <<EOM
This is a multiline String
that has a bunch of information
and interpolation like 4 + 3 = #{ 4 + 3 }
Bye.
EOM
puts multiline_string

first_name = "Victor Pedro"
last_name = "Silva"
middle_name = "Correia"

full_name = "#{first_name} #{middle_name} #{last_name}"
puts full_name

puts "Full name includes Pedro? #{full_name.include?('Pedro')}"
puts "Full name size: #{full_name.size}"
puts "Vogais: " + full_name.count("aeiou").to_s
puts "Consonants: " + full_name.count("^aeiou").to_s
puts "Full name starts with \"Correia\"? " + full_name.start_with?("Correia").to_s
puts "Index: " + full_name.index("Correia").to_s

puts "\n\nCheck equality:"
puts "last_name == last_name? #{last_name == last_name}."
puts "... or, last_name.equal?(middle_name) = " + last_name.equal?(middle_name).to_s


puts "\n\nYou can uppercase, downcase and swap case too:"
puts full_name.upcase
puts full_name.downcase
puts full_name.swapcase

puts "\n\nYou can cut the extra space on left, right or both in the stirng"
puts full_name.lstrip
puts full_name.rstrip
puts full_name.strip

puts full_name.rjust(30, '-')
puts full_name.ljust(30, '-')
puts full_name.center(30, '-')

puts "\n\nYou can cut the last letter or the specific letter from the end with chop and chomp"
puts full_name.chop
puts full_name.chomp('ilva')

puts "\n\nYou can delete specific letter from the entire string"
puts full_name.delete("o")

puts "\n\nAnd you can split the string in an array"
name_array = full_name.split(/ /)
puts name_array
