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
    if delivery_speed < other.delivery_speed
      -1
    elsif delivery_speed == other.delivery_speed
      0
    elsif delivery_speed > other.delivery_speed
      1
    end
  end

  def delivery_speed
    speed / max_weight
  end
end
