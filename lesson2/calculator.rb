# calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'espanol'

def messages(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key)
  puts "=> #{message}"
end

# Valid number without regex
#def valid_number?(number)
#  num_array = number.split('')
#  num_array.shift if num_array[0] == '-'
#  num_array.each do |num|
#    return false unless %w(1 2 3 4 5 6 7 8 9 0 . _).include?(num)
#  end
#  true
#end

def valid_number?(num_str)
  # This regex allows for negative numbers and floats w/ or w/o leading zero
  /^-?\d*\.?\d+$/.match?(num_str)
end

prompt('welcome')

loop do
  num_str = []
  loop do
    prompt('first_num')
    num_str[0] = gets.chomp
    break if valid_number?(num_str[0])
    prompt('invalid_num')
  end
  loop do
    prompt('second_num')
    num_str[1] = gets.chomp
    break if valid_number?(num_str[1])
    prompt('invalid_num')
  end
  # collect two numbers
  num = num_str.map(&:to_f)
  # ask for operation
  operation = ''
  loop do
    prompt('choose_operation')
    prompt('operation_list')
    operation = gets.chomp.downcase
    if %w(add subtract multiply divide + - * /).include?(operation)
      break
    else
      prompt('invalid_operation')
    end
  end
  
  loop do
    if num[1] == 0 && (operation == 'divide' || operation == '/')
      prompt('divide_by_zero')
      input = gets.chomp
      num[1] = input.to_f if valid_number?(input)
      operation = input if %w(add subtract multiply divide + - * /).include?(input)
    else
      break
    end
  end
  # display result
  
  puts "#{num[0]} #{operation} #{num[1]} = #{num.reduce(operation.to_sym)}"
  
  continue = ''
  loop do
    prompt('continue?')
    continue = gets.chomp.downcase
    break if MESSAGES[LANGUAGE]['y'].include?(continue)
    break if MESSAGES[LANGUAGE]['n'].include?(continue)
    prompt('invalid_input')
  end
  break if continue == MESSAGES[LANGUAGE]['n']
end