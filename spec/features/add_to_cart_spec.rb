require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  # SETUP
  before :each do

    @category = Category.create! name: 'Apparel'
  
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


scenario "Click on a Product and adds to cart" do
  # ACT
  visit root_path
  find('.products article:first-child').click_on('Add')
  # DEBUG 
  
  # VERIFY
  expect(page).to have_content 'My Cart (1)'
  save_screenshot

end
end
