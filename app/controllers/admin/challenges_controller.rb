class Admin::ChallengesController < Admin::BaseController

  def new
    @challenge = Challenge.new
    @ingredients = Array.new(3) { @challenge.ingredients.new }
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @ingredient_one = @challenge.ingredients.new(ingredient_params(0))
    @ingredient_two = @challenge.ingredients.new(ingredient_params(1))
    @ingredient_three = @challenge.ingredients.new(ingredient_params(2))

    if all_save
      redirect_to new_recipe_path
    else
      render :new
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:theme)
  end

  def ingredient_params(index)
    params[:challenge][:ingredients_attributes].require(index.to_s.to_sym).permit(:name, :unit, :unit_cost)
  end

  def all_save
    @challenge.save &&
    @ingredient_one.save &&
    @ingredient_two.save &&
    @ingredient_three.save
  end

end
