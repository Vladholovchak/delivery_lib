# frozen_string_literal: true

require_relative 'constants'
require_relative 'transport'

class Bike < Transport
  include Constants
  attr_reader :max_distance

  def initialize
    @max_weight = MAX_BIKE_WEIGHT
    @speed = MAX_BIKE_SPEED
    @max_distance = MAX_DISTANCE
  end
end
