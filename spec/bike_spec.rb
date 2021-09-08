# frozen_string_literal: true

describe Bike do
  let(:bike) { Bike.new }
  let(:car) { Car.new }

  describe 'all' do
    before(:each) { Transport.class_variable_set :@@instances, [] }

    it 'returns all instances of class when they exist' do
      bike2 = Bike.new
      children = [bike, bike2]
      expect(Bike.all).to eq children
    end

    it 'returns [] when instances not created' do
      expect(Bike.all).to eq []
    end
  end

  describe 'find_by' do
    it 'has all find_by methods' do
      methods = Bike.methods(false)
      result = bike.instance_variables.map { |v| "find_by_#{v.to_s.delete_prefix('@')}".to_sym }
      expect(methods).to include(*result)
    end

    context 'find_by_available' do
      it 'find first available' do
        bike2 = Bike.new
        bike.available = false
        expect(Bike.find_by_available(true)).to eq bike2
      end

      it 'find first not available' do
        bike.available = false
        expect(Bike.find_by_available(false)).to eq bike
      end
    end

    context 'find_by_location' do
      xit 'return bike' do
        expect(Bike.find_by_location('On route')).to eq bike
      end

      it 'return nil' do
        expect(Bike.find_by_location('false')).to eq nil
      end
    end

    context 'find_by_max_weight' do
      it 'return bike' do
        expect(Bike.find_by_max_weight(10.0)).to eq bike
      end

      it 'return nil' do
        expect(Bike.find_by_max_weight(30)).to eq nil
      end
    end

    context 'find_by_speed' do
      it 'return bike' do
        expect(Bike.find_by_speed(10)).to eq bike
      end

      it 'return nil' do
        expect(Bike.find_by_speed(15)).to eq nil
      end
    end

    context 'find_by_max_distance' do
      it 'return bike' do
        expect(Bike.find_by_max_distance(30.0)).to eq(bike)
      end

      it 'return nil' do
        expect(Bike.find_by_max_distance(false)).to eq nil
      end
    end

    context 'find_by_number_of_deliveries' do
      it 'return bike' do
        bike.number_of_deliveries = 20
        expect(Bike.find_by_number_of_deliveries(20)).to eq(bike)
      end

      it 'return nil' do
        bike.number_of_deliveries = 5
        expect(Bike.find_by_number_of_deliveries(15)).to eq nil
      end
    end

    context 'find_by_delivery_cost' do
      it 'return bike' do
        bike.delivery_cost = 40
        expect(Bike.find_by_delivery_cost(40)).to eq(bike)
      end

      it 'return nil' do
        bike.delivery_cost = 10
        expect(Bike.find_by_delivery_cost(15)).to eq nil
      end
    end
  end

  describe 'filter_by' do
    it 'has all filter_by methods' do
      methods = Bike.methods(false)
      result = bike.instance_variables.map { |v| "filter_by_#{v.to_s.delete_prefix('@')}".to_sym }
      expect(methods).to include(*result)
    end
  end
end
