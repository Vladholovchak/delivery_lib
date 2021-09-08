# frozen_string_literal: true

describe Car do
  let(:bike) { Bike.new }
  let(:car) { Car.new }

  describe 'all' do
    before(:each) { Transport.class_variable_set :@@instances, [] }

    it 'returns all instances of class when they exist' do
      car2 = Car.new
      children = [car, car2]
      expect(Car.all).to eq(children)
    end

    it 'returns [] when instances not created' do
      expect(Car.all).to eq([])
    end
  end

  describe 'find_by' do
    it 'has all find_by methods' do
      methods = Car.methods(false)
      result = car.instance_variables.map { |v| "find_by_#{v.to_s.delete_prefix('@')}".to_sym }
      expect(methods).to include(*result)
    end

    context 'find_by_available' do
      it 'find first available' do
        car2 = Car.new
        car.available = false
        expect(Car.find_by_available(true)).to eq car2
      end

      it 'find first not available' do
        car.available = false
        expect(Car.find_by_available(false)).to eq car
      end
    end

    context 'find_by_location' do
      xit 'return car' do
        expect(Car.find_by_location('On route')).to eq car
      end

      it 'return nil' do
        expect(Car.find_by_location('false')).to eq nil
      end
    end

    context 'find_by_max_weight' do
      it 'return car' do
        expect(Car.find_by_max_weight(100)).to eq car
      end

      it 'return nil' do
        expect(Car.find_by_max_weight(30)).to eq nil
      end
    end

    context 'find_by_speed' do
      it 'return car' do
        expect(Car.find_by_speed(50)).to eq car
      end

      it 'return nil' do
        expect(Car.find_by_speed(15)).to eq nil
      end
    end

    context 'find_by_registry_number' do
      it 'return car' do
        expect(Car.find_by_registry_number(car.registry_number)).to eq car
      end

      it 'return nil' do
        expect(Car.find_by_registry_number(false)).to eq nil
      end
    end

    context 'find_by_number_of_deliveries' do
      it 'return car' do
        car.number_of_deliveries = 20
        expect(Car.find_by_number_of_deliveries(20)).to eq car
      end

      it 'return nil' do
        car.number_of_deliveries = 5
        expect(Car.find_by_number_of_deliveries(15)).to eq nil
      end
    end

    context 'find_by_delivery_cost' do
      it 'return car' do
        car.delivery_cost = 40
        expect(Car.find_by_delivery_cost(40)).to eq car
      end

      it 'return nil' do
        car.delivery_cost = 10
        expect(Car.find_by_delivery_cost(15)).to eq nil
      end
    end
  end

  describe 'filter_by' do
    it 'has all filter_by methods' do
      methods = Car.methods(false)
      result = car.instance_variables.map { |v| "filter_by_#{v.to_s.delete_prefix('@')}".to_sym }
      expect(methods).to include(*result)
    end
  end
end
