NUMBERS = [1,2,3,4,5,6,7,8]
board = NUMBERS.product(NUMBERS)


def find_queen_positions
  board = NUMBERS.product(NUMBERS)
  queen_spots = []
  loop do
    queen_spot = board.first
    break if queen_spot == nil
    queen_spots << queen_spot
    queen_attacks = []
  
    for i in -8..8
      queen_attacks << [queen_spot[0] + i, queen_spot[1] + i]
      queen_attacks << [queen_spot[0] - i, queen_spot[1] + i]
    end
    queen_attacks += [queen_spot[0]].product(NUMBERS)
    queen_attacks += [queen_spot[1]].product(NUMBERS)
    board -= queen_attacks
  end
  p queen_spots
end


find_queen_positions