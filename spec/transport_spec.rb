# frozen_string_literal: true

describe Transport do
  let!(:bike) { Bike.new }
  let!(:car) { Car.new }

  describe '<=>' do
    context 'when same class and same max_weight' do
      it 'must be equal when class car' do
        car2 = Car.new
        expect(car).to be == car2
      end

      it 'must be equal when class bike' do
        bike2 = Bike.new
        expect(bike).to be == bike2
      end
    end

    context 'when same class and same max_distance' do
      it 'must be equal' do
        bike2 = Bike.new
        expect(bike).to be == bike2
      end
    end

    context 'when different class and different attributes' do
      it 'must be false' do
        expect(bike).not_to be == car
      end
    end
  end

  describe 'delivery_time' do
    context 'when speed present and > 0' do
      it 'show correct value' do
        correct_time = 100 / car.speed
        expect(car.delivery_time(100)).to eq(correct_time)
      end
    end
  end
end
