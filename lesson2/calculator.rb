# calculator.rb

# ask for two numbers
puts "Enter first number:"
num1 = gets.chomp.to_f
puts "Enter second number:"
num2 = gets.chomp.to_f
# collect two numbers

# ask for operation
operation = ''
loop do
  puts ["Choose operation:", "(add, subtract, multiply, divide)"]
  operation = gets.chomp.downcase
  if %w(add subtract multiply divide).include?(operation)
    break
  else
    puts "Operation not recognized"
  end
end
# collect operation

# check operation
loop do
  if operation == 'divide' && num2 == 0
    puts "Second number can not be zero for division, enter new number:"
    num2 = gets.chomp.to_f
  else
    break
  end
end
# display result
case operation
when "add"
  puts "#{num1} + #{num2} = #{num1 + num2}"
when "subtract"
  puts "#{num1} - #{num2} = #{num1 - num2}"
when "multiply"
  puts "#{num1} * #{num2} = #{num1 * num2}"
when "divide"
  puts "#{num1} / #{num2} = #{num1 / num2}"
end
