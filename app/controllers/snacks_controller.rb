class SnacksController < ApplicationController
  def show
    name = Snack.find(params[:id]).name
    @snacks = Snack.where(name: name)
  end
end
