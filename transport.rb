# frozen_string_literal: true

class Transport
  include Comparable
  attr_reader :max_weight, :speed
  attr_accessor :available

  def delivery_time(distance)
    distance / speed
  end

  def <=>(other)
    delivery_speed <=> other.delivery_speed
  end

  def delivery_speed
    speed / max_weight
  end
end
