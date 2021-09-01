# frozen_string_literal: true

require_relative 'car'
require_relative 'bike'

class DeliveryService
  attr_reader :park

  def initialize(bikes: 1, cars: 1)
    @park = []
    add_transport(bikes, Bike.new) if bikes.positive?
    add_transport(cars, Car.new) if cars.positive?
  end

  def find_transport(weight:, distance:)
    @transport = @park.select(&:available)
                      .select { |transport| transport.max_weight >= weight }
                      .sort_by(&:max_weight)
                      .find { |transport| transport.max_distance >= distance }

    return @transport if @transport

    raise { 'There no available transport' }
  end

  private

  def add_transport(amount, transport)
    new_transport = Array.new(amount) { transport }
    @park += new_transport
  end
end
