require 'pry'
require 'pp'
require 'pry-byebug'
require 'yaml'

SPADE = "\u2660"
HEART = "\u2665"
CLUB = "\u2663"
DIAMOND = "\u2666"
CARD_ART = YAML.load_file('card_art.yml')

def prompt(message)
  puts "=> #{message}"
end

def display_cards(player, dealer, bet, final: false) # make way cooler
  system 'clear'
  prompt "Dealer"
  puts format_dealer_cards(dealer, final: final)
  puts ''
  prompt "Player"
  puts format_player_cards(player)
  prompt "Bet: $#{bet}"
end

def format_dealer_cards(hand, final: false)
  return format_player_cards(hand) if final
  rank = hand[1][0]
  r_space = rank == '10' ? '' : ' '
  suit = hand[1][1]
  card_lines = Array.new(14).map! { '|###|                |'.clone }
  card_lines[0] = ".___.________________."
  card_lines[1] = "|###| #{rank}#{r_space}             |"
  card_lines[2] = "|###| #{suit}              |"
  card_lines[11] = "|###|              #{suit} |"
  card_lines[12] = "|###|              #{r_space}#{rank}|"
  card_lines[13] = "L===L________________!"
  case rank
  when 'A' then draw_art!(card_lines, suit)
  when /[KQJ]/ then draw_art!(card_lines, rank)
  else draw_pips!(card_lines, rank.to_i, suit)
  end
  card_lines
end

def draw_art!(card, art_name)
  CARD_ART[art_name].each do |line_num, line|
    card[line_num + 2][6..19] = line
  end
end

def draw_pips!(card, num_pips, suit)
  dub_rows = case num_pips
             when (4..5) then [4, 10]
             when (6..8) then [4, 7, 10]
             when (9..10) then [4, 6, 8, 10]
             else []
             end
  single_rows = case num_pips
                when 2 then [4, 10]
                when 3 then [4, 7, 10]
                when 5 then [7]
                when 7 then [5]
                when 8 then [5, 8]
                when 9 then [7]
                when 10 then [5, 9]
                else []
                end
  dub_rows.each do |row|
    card[row][8] = suit
    card[row][16] = suit
  end 
  single_rows.each do |row|
    card[row][12] = suit
  end
  nil
end


def format_player_cards(hand)
  top_string = ''
  rank_string = ''
  suit_string = ''
  base_string = ''
  hand.each do |card|
    top_string += '._____'
    rank_string += "| #{card[0]}  "
    rank_string += ' ' unless card[0] == '10'
    suit_string += "| #{card[1]}   "
    base_string += '|     '
  end
  [top_string, rank_string, suit_string, base_string]
end

def shuffle_shoe
  ranks = %w(A Q K J 10) + ('2'..'9').to_a
  suits = [SPADE, HEART, CLUB, DIAMOND]
  shoe = ranks.product(suits) * 8
  shoe.shuffle
end

def deal_card!(shoe, hand)
  hand << shoe.pop
end

def card_value(card_rank)
  case card_rank
  when /[KQJ]/ then 10
  when 'A' then 11
  else
    card_rank.to_i
  end
end

def hand_total(hand)
  # hand => [['rank', SUIT], ['A', SPADE], ...]
  sum = 0
  hand.each do |card|
    sum += card_value(card[0])
  end

  current_card = 0
  while sum > 21 && current_card < hand.size
    sum -= 10 if hand[current_card][0] == 'A'
    current_card += 1
  end

  sum
end

#===================================================================#
shoe = shuffle_shoe
player_chips = 100
prompt "Let's Play Black Jack!"

loop do
  bet = 0
  dealer_hand = []
  player_hand = []
  player_total = 0
  dealer_total = 0
  black_jack = false
  busted = { dealer: false, player: false }

  loop do
    prompt "You have $#{player_chips}"
    prompt "How much would you like to bet this hand? (min $5 max $500)"
    bet = gets.chomp.to_i
    break if bet >= 5 && bet <= 500 && bet <= player_chips
    prompt "That's not a valid bet, try again"
  end
  player_chips -= bet

  2.times do
    deal_card!(shoe, player_hand)
    deal_card!(shoe, dealer_hand)
  end

  display_cards(player_hand, dealer_hand, bet)
  player_total = hand_total(player_hand)
  black_jack = true if player_total == 21
  # player turn
  loop do
    break if black_jack
    prompt "Would you like to hit or stay? (h/s)"
    hit_or_stay = gets.chomp.downcase
    if hit_or_stay.start_with?('h')
      deal_card!(shoe, player_hand)
      display_cards(player_hand, dealer_hand, bet)
    else
      prompt "Invalid input, try again"
    end
    player_total = hand_total(player_hand)
    if player_total > 21
      busted[:player] = true
      break
    end
    break if hit_or_stay.start_with?('s')
  end

  # dealer turn
  loop do
    break if black_jack
    dealer_total = hand_total(dealer_hand)
    if dealer_total > 21
      busted[:dealer] = true
    end
    break if dealer_total >= 17 || busted.values.any?
    deal_card!(shoe, dealer_hand)
    display_cards(player_hand, dealer_hand, bet, final: true)
    sleep(2)
  end

  # determine winner
  if busted[:dealer]
    winner = 'Player'
    display_cards(player_hand, dealer_hand, bet, final: true)
    prompt "Dealer BUST!"
  elsif busted[:player]
    winner = 'Dealer'
    prompt "Player BUST!"
  else
    winner = case player_total <=> dealer_total
             when 1 then 'Player'
             when -1 then 'Dealer'
             when 0 then 'PUSH'
             end
    display_cards(player_hand, dealer_hand, bet, final: true)
  end
  player_chips += bet * 2 if winner == 'Player'
  player_chips += bet if winner == 'PUSH'
  player_chips += bet / 2 if winner == 'Player' && black_jack
  
  prompt "BLACK JACK!" if black_jack
  if winner == 'PUSH'
    prompt "The hand is a #{winner}"
  else
    prompt "#{winner} is the winner!"
  end
  
  keep_playing = 'n'
  loop do
    prompt "Keep playing? (y/n)"
    keep_playing = gets.chomp.downcase[0]
    break if ['y', 'n'].include?(keep_playing)
    prompt "Invalid input, try again"
  end
  if keep_playing == 'n'
    break
  elsif player_chips < 5
    prompt "You no longer have enough chips"
    break
  end

  if shoe.size < 104
    prompt "The dealer is shuffling"
    sleep(5)
    shoe = shuffle_shoe
  end
end
prompt "You leave the table with $#{player_chips}"
prompt "Good Bye!"
