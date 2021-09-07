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

  # TODO: Define filters and finders
  # Car.new.instance_variables.each do |i|
  #   define_method("find_by_#{i.to_s.delete_prefix('@')}".to_sym) do
  #     # find {|arg| arg }
  #   end
  # end

  def self.all
    super.select { |inst| inst.instance_of? Car }
  end
end
