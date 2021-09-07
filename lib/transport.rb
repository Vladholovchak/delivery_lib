# frozen_string_literal: true

class Transport
  include Comparable
  attr_reader :max_weight, :speed, :location, :number_of_deliveries, :delivery_cost
  attr_accessor :available
  @@instances = []

  def initialize
    max_weight
    speed
    @available = true
    @location = ['On route', 'In garage']
    number_of_deliveries
    delivery_cost
    @@instances << self
  end

  def delivery_time(distance)
    distance / speed
  end

  def <=>(other)
    if max_weight < other.max_weight
      -1
    elsif max_weight == other.max_weight
      if check_respond(self, :max_distance) < check_respond(other, :max_distance)
        -1
      elsif check_respond(self, :max_distance) > check_respond(other, :max_distance)
        1
      else
        0
      end
    else
      1
    end
  end

  def check_respond(obj, attr)
    obj.respond_to?(attr) ? obj.instance_eval(attr.to_s) : Float::INFINITY
  end

  def self.all
    @@instances
  end
end
