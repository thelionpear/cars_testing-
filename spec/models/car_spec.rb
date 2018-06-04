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

end
