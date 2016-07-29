class Game
  FRAMES = 10

  attr_reader :frames
  
  def initialize
    @frames = []
  end

  def roll(score)
    check_valid_roll(score)
    
    if current_frame_open?
      frames.last.add(score)
    else
      frames << Frame.new(score)
    end

    frames.slice(0, frames.length - 1).each do |frame|
      frame.add(score) if frame.status != :closed
    end
  end

  def score
    raise unclosed_game_error_message unless game_closed?
    frames.slice(0, FRAMES).reduce(0) { |total, frame| total + frame.total }
  end

  def check_valid_roll(score)
    raise 'Pins must have a value from 0 to 10' unless (0..10).cover?(score)
    raise 'Should not be able to roll after game is over' if game_closed?
  end

  def current_frame_open?
    frames.last&.status == :current_frame 
  end

  def game_closed?
    frames[FRAMES - 1]&.status == :closed
  end

  def unclosed_game_error_message
    return 'Game is not yet over, cannot score!' if @frames[FRAMES - 1]&.status == :bonus
    'Score cannot be taken until the end of the game'
  end
end

class Frame
  SPARE_OR_STRIKE_SCORE = 10
  attr_accessor :status
  attr_reader :scores

  def initialize(initial_score)
    @scores = [initial_score]
    @status = initial_score == SPARE_OR_STRIKE_SCORE ? :bonus : :current_frame
  end

  def add(score)
    scores.push(score)
    raise 'Pin count exceeds pins on the lane' if total > 10 && status == :current_frame
    self.status = :bonus if total == SPARE_OR_STRIKE_SCORE
    self.status = :closed if frame_closed?
  end

  def total
    scores.reduce(:+)
  end

  def frame_closed?
    scores.length == 3 || total < PIN_TOTAL && scores.length == 2
  end
end