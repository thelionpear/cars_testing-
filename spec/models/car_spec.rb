require 'rails_helper'

RSpec.describe Car, type: :model do

  describe 'attributes' do
    attributes = [
      :make, 
      :model, 
      :price, 
      :interior, 
      :color, 
      :mileage
    ].each { |attr| it { should respond_to attr } }
    #below is a longer option 
    # attributes.each do |attr|
    #   it { should respond_to attr }
  #below is an even longer option 
  #  it { should respond_to :make }
  #  it { should respond_to :model }
  #  it { should respond}
    # end 
  end 

  describe 'validations' do 
    it { should validate_presence_of(:make) }
  end 

  describe 'methods' do 
    context 'class' do 

      before(:each) do 
        @car1 = Car.create(make: 'Zcar', model: 'T-rex', price: 2000 )
        @car2 = Car.create(make: 'Lcar', model: 'Z-rex', price: 5)
        @car3 = Car.create(make: 'Acar', model: 'A-rex', price: 30000)
        @car4 = Car.create(make: 'Bcar', model: 'B-rex', price: 800)
      end 

      it 'orders by model asc' do 
        @cars = Car.by_model
        #expect(@cars).to eq([@car3, @car4, @car1, @car2])
        expect(@cars[0]).to eq(@car3)
        expect(@cars[1]).to eq(@car4)
        expect(@cars[2]).to eq(@car1)
        expect(@cars[3]).to eq(@car2)
      end 

      it 'orders by make asc' do 
        @cars = Car.by_make
        #expect(@cars).to eq([@car3, @car4, @car2, @car1])
        expect(@cars[0]).to eq(@car3)
        expect(@cars[1]).to eq(@car4)
        expect(@cars[2]).to eq(@car2)
        expect(@cars[3]).to eq(@car1)
      end 

      it 'orders by price asc' do 
        @cars = Car.by_price
        #expect(@cars).to eq([@car2, @car4, @car1, @car2])
        expect(@cars[0]).to eq(@car2)
        expect(@cars[1]).to eq(@car4)
        expect(@cars[2]).to eq(@car1)
        expect(@cars[3]).to eq(@car3)
      end 

      it 'orders by price desc' do 
        @cars = Car.by_price(:desc)
        #expect(@cars).to eq([@car3, @car1, @car4, @car2])
        expect(@cars[0]).to eq(@car3)
        expect(@cars[1]).to eq(@car1)
        expect(@cars[2]).to eq(@car4)
        expect(@cars[3]).to eq(@car2)
      end 
    end 
  end  

    context 'instance' do 

      before(:each) do

        @attr = ActiveSupport::HashWithIndifferentAccess.new ({ 
          age: 2,
          make: 'Toyota',
          price: 10000.0,
          model: 'Prius',
          mileage: 1000,
          interior: 'Leather',
          color: 'Red' 
        })
        @car = Car.create(@attr)
      end 

      it 'paints the car' do
        expected = 'Pink'
        @car.paint(expected)
        expect(@car.color).to eq(expected)
      end 

      it 'returns the car info' do 
        expect(@car.info).to eq(@attr)
      end 

      it 'honks the horn' do
        expect(@car.honk).to eq('Beep Beep')
      end 

    
  end 
end
