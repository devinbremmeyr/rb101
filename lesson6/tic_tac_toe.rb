require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
FIRST_PLAYER = 'Player'

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delim = ', ', conj = 'or')
  last = arr.pop
  str_out = arr.join(delim)
  str_out += " #{conj} " unless arr.empty?
  str_out + last.to_s
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
  nil
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    line.find { |square| brd[square] == INITIAL_MARKER }
  end
end

def computer_places_piece!(brd)
  square = nil
  [COMPUTER_MARKER, PLAYER_MARKER].each do |marker|
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, marker)
      break if square
    end
    break if square
  end
  square ||= 5 if brd[5] == INITIAL_MARKER
  square ||= empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
  nil
end

def place_piece!(player, brd)
  case player
  when 'Player' then player_places_piece!(brd)
  when 'Computer' then computer_places_piece!(brd)
  end
end

def alternate_player(player)
  if player == 'Player'
    'Computer'
  else
    'Player'
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_score = 0
computer_score = 0
current_player = FIRST_PLAYER
prompt("LET'S PLAY TIC TAC TOE!")

loop do
  board = initialize_board
  prompt("#{current_player} will go first")
  prompt('Change first player? (y/n)')
  if gets.chomp.downcase.start_with?('y')
    current_player = alternate_player(current_player)
  end

  loop do
    display_board(board)

    place_piece!(current_player, board)
    break if someone_won?(board) || board_full?(board)
    current_player = alternate_player(current_player)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    case winner
    when 'Player' then player_score += 1
    when 'Computer' then computer_score += 1
    end
    prompt "#{winner} won the match."
  else
    prompt "The match is a tie"
  end
  prompt "GAME SCORE:"
  prompt "Player: #{player_score}"
  prompt "Computer: #{computer_score}"
  if player_score > 4 || computer_score > 4
    prompt "#{winner.upcase} WINS THE GAME!"
    break
  end
  current_player = alternate_player(current_player)
  prompt "Keep playing? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
