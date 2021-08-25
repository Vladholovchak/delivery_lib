# frozen_string_literal: true

require_relative 'constants'
require_relative 'transport'

class Car < Transport
  include Constants
  attr_reader :max_weight

  def initialize
    super
    @registry_number = rand(100)
    @max_weight = MAX_CAR_WEIGHT
    @speed = MAX_CAR_SPEED
  end
end
