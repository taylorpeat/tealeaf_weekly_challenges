class Game
  ROUNDS = 10

  attr_accessor :rounds
  
  def initialize
    @rounds = []
  end

  def roll(score)
    check_valid_roll(score)
    
    rounds.last&.status == :open ? rounds.last.add(score) : rounds << Round.new(score)

    rounds.slice(0, rounds.length - 1).each do |round|
      round.add(score) if round.status != :finished
    end
  end

  def score
    raise unfinished_game_error_message unless game_finished?
    rounds.slice(0, ROUNDS).reduce(0) { |total, round| total + round.total }
  end

  def check_valid_roll(score)
    raise 'Pins must have a value from 0 to 10' unless (0..10).cover?(score)
    raise 'Should not be able to roll after game is over' if game_finished?
  end

  def game_finished?
    rounds[ROUNDS - 1]&.status == :finished
  end

  def unfinished_game_error_message
    return 'Game is not yet over, cannot score!' if @rounds[ROUNDS - 1]&.status == :xtra_balls
    'Score cannot be taken until the end of the game'
  end
end

class Round
  PIN_TOTAL = 10
  attr_accessor :status
  attr_reader :scores

  def initialize(initial_score)
    @scores = [initial_score]
    @status = initial_score == PIN_TOTAL ? :xtra_balls : :open
  end

  def add(score)
    scores.push(score)
    raise 'Pin count exceeds pins on the lane' if total > 10 && status == :open
    self.status = :xtra_balls if total == PIN_TOTAL
    self.status = :finished if round_finished?
  end

  def total
    scores.reduce(:+)
  end

  def round_finished?
    scores.length == 3 || total < PIN_TOTAL && scores.length == 2
  end
end