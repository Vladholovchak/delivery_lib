# frozen_string_literal: true

require_relative 'modules/constants'
require_relative 'transport'

class Bike < Transport
  include Constants::Bike
  attr_reader :max_distance

  def initialize
    super
    @max_weight = MAX_WEIGHT
    @speed = MAX_SPEED
    @max_distance = MAX_DISTANCE
  end
end
