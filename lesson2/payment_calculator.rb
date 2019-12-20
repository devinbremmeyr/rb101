# payment_calculator.rb

# get loan amount
puts "Enter the principle value of the loan:"
principle = gets.chomp.to_f
# get the annual percentage rate(APR)
puts "Enter the annual percentage rate as a decimal e.g. 0.03 for 3%:"
apr = gets.chomp.to_f
# get the loan duration
puts "Enter the length of the loan in years"
duration = gets.chomp.to_f

# calculate monthly interest rate
monthly_interest_rate = apr / 12.0
# calculate loan duration in months
duration_in_months = duration * 12.0

monthly_payment = principle * (monthly_interest_rate / \
  (1 - (1 + monthly_interest_rate)**(-duration_in_months)))

puts "The monthly payment is #{monthly_payment}"
