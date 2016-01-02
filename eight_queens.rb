require 'pry'

NUMBERS = [1,2,3,4,5,6,7,8]
board = NUMBERS.product(NUMBERS)


def find_queen_positions
  queen_eight_spots = 0
  starting_spots = []
  loop do 
    board = NUMBERS.product(NUMBERS)
    queen_spots = []
    starting_spot = (board - starting_spots).first
    return queen_eight_spots if starting_spot == nil
    loop do
      queen_spot ||= board.first
      break if queen_spot == nil
      queen_spots << queen_spot
      queen_attacks = []
    
      for i in -8..8
        queen_attacks << [queen_spot[0] + i, queen_spot[1] + i]
        queen_attacks << [queen_spot[0] - i, queen_spot[1] + i]
      end

      queen_attacks += [queen_spot[0]].product(NUMBERS)
      queen_attacks += NUMBERS.product([queen_spot[1]])
      board -= queen_attacks
      queen_spot = nil
    end
    queen_eight_spots += 1 if queen_spots == 8
    starting_spots += [starting_spot]
  end
end


def remove_starting_spots(current_spot, board)
  loop do
      queen_spot ||= board.first
      break if queen_spot == nil
      queen_spots << queen_spot
      queen_attacks = []
    
      for i in -8..8
        queen_attacks << [queen_spot[0] + i, queen_spot[1] + i]
        queen_attacks << [queen_spot[0] - i, queen_spot[1] + i]
      end

      queen_attacks += [queen_spot[0]].product(NUMBERS)
      queen_attacks += NUMBERS.product([queen_spot[1]])
      board -= queen_attacks
      queen_spot = nil
    end
end

puts find_queen_positions