require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create(name: "Forest") }

   it 'returns true when name, price, quantity, and category are there' do
    product = category.products.new(name: "A", price: 1, quantity: 1)
    expect(product.valid?).to be true
   end
   it 'returns false when name is nil' do
    product = category.products.new(name: nil, price: 1, quantity: 1)
    expect(product.valid?).to be false
  end 
  it 'returns false when price is not there' do
    product = category.products.new(name: "A", quantity: 1)
    expect(product.valid?).to be false
  end 
  it 'returns false when quantity is not there' do
    product = category.products.new(name: "A", price: 1)
    expect(product.valid?).to be false
  end 
  it 'returns false when there is no category' do
    product = Product.new(name: "A", price: 1, quantity: 1)
  expect(product.valid?).to be false
  end 
  end
end
