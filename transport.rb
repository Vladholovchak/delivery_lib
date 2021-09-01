# frozen_string_literal: true

class Transport
  include Comparable
  attr_reader :max_weight, :speed
  attr_accessor :available

  def initialize
    max_weight
    speed
    @available = true
  end

  def delivery_time(distance)
    distance / speed
  end

  def <=>(other)
    if max_weight < other.max_weight
      -1
    elsif max_weight == other.max_weight
      if max_distance < other.max_distance
        -1
      elsif max_distance > other.max_distance
        1
      else
        0
      end
    else
      1
    end
  end

  def max_distance
    @max_distance || Float::INFINITY
  end
end
