require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'can create valid product' do
    @category = Category.create(name: "new category")
    @product = Product.create(category: @category, name: 'new name', price: 10, quantity: 1 )
  
    expect(@product).to be_valid
    end

  it 'should require name' do
    @category = Category.create(name: "furniture")
    @product = Product.create(category: @category, name:nil, price:20, quantity:3 )
    
    expect(@product).to_not be_valid
  end

  it 'should require price' do
    @category = Category.create(name: "furniture")
    @product = Product.create(category: @category, name:"new product", quantity:3 )
    
    expect(@product).to_not be_valid
  end
  

  it 'should require quantity' do
    @category = Category.create(name: "furniture")
    @product = Product.create(category: @category, name:"new product2", price:20 )
    
    expect(@product).to_not be_valid
  end

  it 'should require category' do
    @product = Product.create(name:"new product", price:20, quantity:3 )
    
    expect(@product).to_not be_valid
  end

end
