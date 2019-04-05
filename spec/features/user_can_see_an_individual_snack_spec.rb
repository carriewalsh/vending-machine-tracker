require "rails_helper"

RSpec.describe "When a user visits a snack show page", type: :feature do
  before :each do
    @sam = Owner.create(name: "Sam's Snacks")
    @machine1 = @sam.machines.create(location: "Don's Mixed Drinks")
    @machine2 = @sam.machines.create(location: "Turing Basement")

    @charles = Owner.create(name: "Chuck's Foods")
    @machine3 = @charles.machines.create(location: "Chuck's Palace")
    @machine4 = @charles.machines.create(location: "Yo Mamma's House")

    @cheetos1 = @machine1.snacks.create(name: "Cheetos", price: 3)
    @fritos = @machine1.snacks.create(name: "Fritos", price: 2)
    @doritos = @machine1.snacks.create(name: "Doritos", price: 2.5)
    @carrots = @machine2.snacks.create(name: "Carrots", price: 5)
    @hummus = @machine2.snacks.create(name: "Hummus", price: 6)
    @cheetos2 = @machine2.snacks.create(name: "Cheetos", price: 4)
    @carrots2 = @machine3.snacks.create(name: "Carrots", price: 5)
    @hummus2 = @machine4.snacks.create(name: "Hummus", price: 6)
    @cheetos3 = @machine4.snacks.create(name: "Cheetos", price: 4)
  end

  describe "as a visitor on a snack show page" do
    it "should show me information for the snack" do
      visit snack_path(@cheetos1)

      expect(page).to have_content("Cheetos")
      expect(page).to have_content("Average price: #{@cheetos1.avg_price}")
    end

    it "should show me a list of locations that sell that snack with info" do
      visit snack_path(@cheetos1)
      expect(page).to have_content("#{@machine1.location}")
      expect(page).to have_content("#{@machine2.location}")
      expect(page).to have_content("#{@machine4.location}")
    end
  end


end
