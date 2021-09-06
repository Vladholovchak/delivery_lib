describe DeliveryService do
  describe 'create park' do
    context 'with attributes' do
      let(:delivery_service) { DeliveryService.new(bikes: 3, cars: 5) }

      it 'has elements in array' do
        expect(delivery_service.park).not_to be_empty
      end

      it 'has 3 bikes in array' do
        bikes = delivery_service.park.select { |el| el.instance_of?(Bike) }
        expect(bikes.count).to eq(3)
      end

      it 'has 5 cars in array' do
        cars = delivery_service.park.select { |el| el.instance_of?(Car) }
        expect(cars.count).to eq(5)
      end
    end

    context 'without attributes' do
      let(:delivery_service) { DeliveryService.new }

      it 'has elements in array' do
        expect(delivery_service.park).not_to be_empty
      end

      it 'has car and  bike' do
        expect(delivery_service.park.first).to be_a(Bike)
        expect(delivery_service.park.last).to be_a(Car)
      end
    end

    context 'when set 0 cars and 0 bikes' do
      it 'has empty park' do
        delivery_service = DeliveryService.new(bikes: 0, cars: 0)
        expect(delivery_service.park).to be_empty
      end
    end
  end

  describe 'finding transport' do
    let(:delivery_service) { DeliveryService.new(bikes: 3, cars: 5) }

    context 'need find car' do
      let(:result) { delivery_service.find_transport(distance: 100, weight: 100) }

      it 'value can\'t be nil ' do
        expect(result).not_to be_nil
      end

      it 'find correct value' do
        expected_result = delivery_service.park[3]
        expect(result).to eq(expected_result)
      end

      it 'find correct value when weight > bike max weight' do
        expected_result = delivery_service.park[3]
        result = delivery_service.find_transport(distance: 20, weight: 15)
        expect(result).to eq(expected_result)
      end
    end

    context 'need find bike' do
      it 'find correct value ' do
        expected_result = delivery_service.park[0]
        result = delivery_service.find_transport(distance: 10, weight: 10)
        expect(result).to eq(expected_result)
      end
    end

    context 'when parameters very high' do
      it 'raise error ' do
        expect { delivery_service.find_transport(distance: 20, weight: 200) }.to raise_error('There no available transport')
      end
    end
  end
end
