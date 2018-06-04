require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes' do
    it 'has a make' do
      make = 'Toyota'
      car = Car.create(make: make)
      expect(car.make).to eq(make) 
    end 
  end 
end
