class RecipesController < ApplicationController

  def new
    @challenge = Challenge.last
    @ingredients = @challenge.ingredients
  end
end
