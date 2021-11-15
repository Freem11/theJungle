require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
   
    it "should generate a validate a product" do
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: "Test-a",
        price_cents: 50,
        quantity: 10,
        category_id: @category.id
      )
      expect(@product).to be_valid
    end

    it "should not make a product if name is nil" do
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: nil,
        price_cents: 50,
        quantity: 10,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it "should not make a product if price is nil" do
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: "Test-a",
        price_cents: nil,
        quantity: 10,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it "should not make a product if quantity is nil" do
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: "Test-a",
        price_cents: 50,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it "should not make a product if category is nil" do
      @category = Category.create(name: "Test")
      @product = Product.new(
        name: "Test-a",
        price_cents: 50,
        quantity: 10,
        category_id: nil
      )
      expect(@product).to_not be_valid
    end

  end
end
