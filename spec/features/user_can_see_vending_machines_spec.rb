require 'rails_helper'

RSpec.describe "When a user visits the vending machine index", type: :feature do
  before :each do
    @sam = Owner.create(name: "Sam's Snacks")
    @machine1 = @sam.machines.create(location: "Don's Mixed Drinks")
    @machine2 = @sam.machines.create(location: "Turing Basement")

    @cheetos1 = @machine1.snacks.create(name: "Cheetos", price: 3)
    @fritos = @machine1.snacks.create(name: "Fritos", price: 2)
    @doritos = @machine1.snacks.create(name: "Doritos", price: 2.5)
    @carrots = @machine2.snacks.create(name: "Carrots", price: 5)
    @hummus = @machine2.snacks.create(name: "Hummus", price: 6)
    @cheetos2 = @machine2.snacks.create(name: "Cheetos", price: 4)
  end

  scenario "they see a list of vending machine locations" do

    visit owner_machines_path(@sam)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
  end

  describe "as a visitor on the vending machine show page" do
    it "should show me a list of all the snacks in the machine with their prices" do
      visit machine_path(@machine1)
      expect(page).to have_content("#{@cheetos1.name}")
      expect(page).to have_content("Price: $#{@cheetos1.price}")
      expect(page).to have_content("#{@fritos.name}")
      expect(page).to have_content("Price: $#{@fritos.price}")
      expect(page).to have_content("#{@doritos.name}")
      expect(page).to have_content("Price: $#{@doritos.price}")
      expect(page).to_not have_content("#{@carrots.name}")
      expect(page).to_not have_content("Price: $#{@carrots.price}")
    end

    it "should show me the average price of all the snacks in the machine" do
      visit machine_path(@machine1)
      expect(page).to have_content("Average price: #{@machine1.avg_price}")
    end
  end
end
