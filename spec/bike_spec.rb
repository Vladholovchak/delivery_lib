# frozen_string_literal: true

describe Car do
  let(:bike) { Bike.new }
  let(:car) { Car.new }

  before(:each) { Transport.class_variable_set :@@instances, [] }

  describe 'all' do
    it 'returns all instances of class when they exist' do
      bike2 = Bike.new
      children = [bike, bike2]
      expect(Bike.all).to eq(children)
    end

    it 'returns [] when instances not created' do
      expect(Bike.all).to eq([])
    end
  end

  describe 'find_by' do
    it 'has all find_by methods' do
      methods = Bike.methods(false)
      result = bike.instance_variables.map { |v| "find_by_#{v.to_s.delete_prefix('@')}".to_sym }
      expect(methods).to include(*result)
    end

    context 'find_by_available' do

    end

    context 'find_by_location' do

    end

    context 'find_by_max_weight' do

    end

    context 'find_by_speed' do

    end

    context 'find_by_max_distance' do

    end

    context 'find_by_number_of_deliveries' do

    end

    context 'find_by_delivery_cost' do

    end
  end
end
