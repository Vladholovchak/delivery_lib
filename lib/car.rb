# frozen_string_literal: true

require_relative 'modules/constants'
require_relative 'transport'

class Car < Transport
  include Constants::Car
  attr_reader :max_weight, :registry_number

  def initialize
    super
    @registry_number = rand(100)
    @max_weight = MAX_WEIGHT
    @speed = MAX_SPEED
    @number_of_deliveries = 0
    @delivery_cost = 0
  end

  def self.all
    super.select { |inst| inst.instance_of? Car }
  end

  Car.new.instance_variables.each do |attr|
    # find by
    singleton_class.define_method("find_by_#{attr.to_s.delete_prefix('@')}".to_sym) do |arg|
      all.find { |ins| ins.public_send(attr.to_s.delete_prefix('@')) == arg }
    end

    # filter by
    singleton_class.define_method("filter_by_#{attr.to_s.delete_prefix('@')}".to_sym) do |&block|
      all.send(:select, &block) if block_given?
    end
  end
end
