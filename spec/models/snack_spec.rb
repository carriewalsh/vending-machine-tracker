require "rails_helper"

RSpec.describe Snack, type: :model do
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

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
  end

  describe "relationships" do
    it {should have_many :snack_machines}
    it {should have_many :machines}
  end

  describe "avg_price" do
    it "should find the average price of the snack for all machines" do
      expect(@cheetos1.avg_price).to eq(3.5)
    end
  end
end
