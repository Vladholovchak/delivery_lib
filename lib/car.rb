# frozen_string_literal: true

require_relative 'modules/constants'
require_relative 'transport'

class Car < Transport
  include Constants::Car
  attr_reader :max_weight

  def initialize
    super
    @registry_number = rand(100)
    @max_weight = MAX_WEIGHT
    @speed = MAX_SPEED
  end
end
