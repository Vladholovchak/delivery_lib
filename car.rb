# frozen_string_literal: true

require_relative 'constants'
require_relative 'transport'

class Car < Transport
  include Constants
  attr_reader :max_weight

  def initialize(registry_number)
    @max_weight = MAX_CAR_WEIGHT
    @speed = MAX_CAR_SPEED
    @registry_number = registry_number
    @available = true
  end
end
