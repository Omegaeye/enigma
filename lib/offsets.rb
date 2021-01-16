require 'time'

class Offsets

  attr_reader :date

  def initialize(date = Time.now.strftime("%d%m%y"))
    @date = date
  end

  def square
    (@date.to_i ** 2).digits[0..3].reverse
  end

  def offset_a
     square[0]
  end

  def offset_b
    square[1]
  end

  def offset_c
    square[2]
  end

  def offset_d
    square[3]
  end

end
