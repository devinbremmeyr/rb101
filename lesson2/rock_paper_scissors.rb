# rock_paper_scissors.rb
VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts("=> #{message}")
end

# Returns true if first wins over second, otherwise returns false
def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win this round!")
  elsif win?(computer, player)
    prompt("Computer wins this round!")
  else
    prompt("This round is a tie!")
  end
end

loop do
  prompt("Welcome to best of 5 #{VALID_CHOICES.join(', ')}!")
  player_score = 0
  computer_score = 0
  round = 0
  
  while player_score < 5 && computer_score < 5
    round += 1
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp
      
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end
    computer_choice = VALID_CHOICES.sample()
    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
    display_results(choice, computer_choice)
    
    player_score += 1 if win?(choice, computer_choice) 
    computer_score += 1 if win?(computer_choice, choice)
    
    prompt("Round #{round}: Your Score: #{player_score} Computer Score: #{computer_score}")
  end
  prompt("YOU WON! 5 out of #{round} rounds!") if player_score == 5
  prompt("COMPUTER WINS 5 out of #{round} rounds!") if computer_score == 5
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end