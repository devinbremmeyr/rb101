# payment_calculator.rb

def prompt(message)
  puts "=> #{message}"
end
prompt "Welcome to Loan Payment Calculator"
prompt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
loop do
  # get loan amount
  principle = ''
  loop do
    prompt "Enter the principle value of the loan:"
    principle = gets.chomp.to_f
    break if principle > 0
    prompt "Input invalid try again"
  end
  # get the annual percentage rate(APR)
  apr = ''
  loop do
    prompt "Enter the annual percentage rate e.g. 3 for 3%:"
    apr = gets.chomp.to_f
    break if apr > 0 && apr <= 100
    prompt "Input invalid try again"
  end
  # get the loan duration
  duration = 0.0
  loop do
    prompt "Enter the duration of the loan in years:"
    duration = gets.chomp.to_f
    break if duration > 0
    prompt "Input invalid try again"
  end
  # calculate monthly interest rate
  monthly_interest_rate = (apr / 100) / 12.0
  # calculate loan duration in months
  duration_in_months = duration * 12.0
  # calculate monthly payment
  monthly_payment = principle * (monthly_interest_rate / \
  (1 - (1 + monthly_interest_rate)**(-duration_in_months)))

  prompt "The monthly payment is $#{monthly_payment.round(2)}"
  continue = ''
  loop do
    prompt "Would you like to calculate another monthly payment? (y/n)"
    continue = gets.chomp.downcase
    break if continue == 'y'
    break if continue == 'n'
    puts "Input invalid try again"
  end
  break if continue == 'n'
end
prompt "Thank you for using Loan Payment Calculator"
prompt "~~~~~~~~~~~~~~~~ Goodbye ~~~~~~~~~~~~~~~~~~"
