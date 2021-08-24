# frozen_string_literal: true

require_relative 'car'
require_relative 'bike'

class DeliveryService
  attr_reader :park

  def initialize(bikes_count: 1, cars_count: 1)
    @park = []
    add_transport(bikes_count, create_bike) if bikes_count > 0
    add_transport(cars_count, create_car) if cars_count > 0
  end

  def find_transport(weight:, distance:)
    @transport = @park
    find_available_transport
    with_correct_weight(weight)
    return select_bike(distance) unless select_bike(distance).nil?

    @transport.empty? ? 'There no available transport' : @transport.first
  end

  private

  # for park

  def create_car
    Car.new("number #{rand(100)}")
  end

  def create_bike
    Bike.new
  end

  def add_transport(amount, transport)
    amount.times { @park << transport }
  end

  # for finding transport

  def find_available_transport
    @transport.select!(&:available)
  end

  def with_correct_weight(weight)
    @transport.select! { |transport| transport.max_weight >= weight }
  end

  def select_bike(distance)
    @transport.find { |transport| (transport.instance_of?(Bike) && transport.max_distance > distance) }
  end
end
