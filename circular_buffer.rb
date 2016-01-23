class CircularBuffer

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
  
  attr_accessor :buffer
  attr_reader :buffer_max

  def initialize(size_input)
    @buffer_max = size_input
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer.size == 0
    buffer.shift
  end

  def write(value)
    raise BufferFullException if buffer.size >= buffer_max
    add_value_to_buffer(value)
  end

  def write!(value)
    add_value_to_buffer(value)
    buffer.shift if buffer.size > buffer_max
  end

  def add_value_to_buffer(value)
    buffer << value unless value == nil
  end

  def clear
    buffer.clear
  end

end

