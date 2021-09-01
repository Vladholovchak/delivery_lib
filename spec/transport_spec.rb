# frozen_string_literal: true

class MotorBike < Transport

  def initialize(max_weight:, max_distance:)
    @max_weight = max_weight
    @max_distance = max_distance
  end
end

class CosmoBike < Transport
  def initialize(max_weight:)
    @max_weight = max_weight
  end
end

describe Transport do
  let(:motorbike) { MotorBike.new(max_weight: 10, max_distance: 30) }
  let(:cosmobike) { CosmoBike.new(max_weight: 100) }

  context '#comparable' do

    it 'when different class and same attributes' do
      motorbike2 = MotorBike.new(max_weight: 10, max_distance: 30)
      cosmobike2 = CosmoBike.new(max_weight: 100)
      expect(motorbike == motorbike2).to be_truthy
      expect(cosmobike == cosmobike2).to be_truthy
    end

    it 'when same class and different attributes' do
      motorbike2 = MotorBike.new(max_weight: 10, max_distance: 40)
      cosmobike2 = CosmoBike.new(max_weight: 50)
      expect(motorbike == motorbike2).to be_falsey
      expect(motorbike2 > motorbike).to be_truthy
      expect(cosmobike > cosmobike2).to be_truthy
    end

    it 'when same max_weight' do
      cosmobike2 = CosmoBike.new(max_weight: 10)
      expect(motorbike == cosmobike2).to be_falsey
      expect(motorbike < cosmobike2).to be_truthy
    end
  end
end
