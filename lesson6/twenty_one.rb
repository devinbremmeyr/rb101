SPADE = "\u2660"
HEART = "\u2665"
CLUB = "\u2663"
DIAMOND = "\u2666"
CARD_VALUES = Hash.new { |hash, key| hash[key] = key.to_i }.merge(
              {'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10})
puts "A: #{CARD_VALUES['A']} 7: #{CARD_VALUES['7']} 8: #{CARD_VALUES[8]}"
puts "Spade #{SPADE} Heart #{HEART} Club #{CLUB} Diamond #{DIAMOND}"

# Initialize deck
def shuffled_deck
  card_numbers = %w(A Q K J 10) + ('2'..'9').to_a
  deck = []
  [SPADE, HEART, CLUB, DIAMOND].each do |suit|
    card_numbers.each { |number| deck << ("#{number} #{suit}")}
    end
    deck
    #deck.shuffle
end

puts shuffled_deck
# deal cards to player and dealer
# deal card(hand)
# => take first card from deck
# => add it to hand with value

# display cards

# ask player hit or stay
# => if stay dealer turn
# => hand total if bust dealer win
# => ask again

# def hand total(hand)
# total = sum of values
# => while aces && total > 21
# => change value of one ace to 1
# => update total
# return the value of cards in hand
# => hand.values.reduce(:+) 

# dealer turn
# => if hand total < 17 hit
# => if hand total > 21 bust player win
# => if hand toal > 17 but < 21 stay

# compare hand totals to determine winner

# declare winner
