require 'pry'
class SecretHandshake

  def initialize(init_number)
    @number = init_number.to_i
  end

  def commands
    command_arr = []
    reverse = false
    
    if @number >= 16
      @number -= 16
      reverse = true
    end
    if @number >= 8
      @number -= 8
      command_arr << "jump"
    end
    if @number >= 4
      @number -= 4
      command_arr << "close your eyes"
    end
    if @number >= 2
      @number -= 2
      command_arr << "double blink"
    end
    if @number >= 1
      @number -= 1
      command_arr << "wink"
    end

    command_arr.reverse! unless reverse
    command_arr
  end
end