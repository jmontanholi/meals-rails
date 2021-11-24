class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  def general_list
    @user = current_user
    @recipes = @user.recipes.includes(recipe_foods: [:food])
    @food_count = helpers.food_count(@recipes)
    @price_count = helpers.price_count(@recipes)
    @recipe_foods = helpers.recipe_foods(@recipes)
  end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
  end

  # GET /recipe_foods/1/edit
  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find(params[:recipe_food][:recipe_id])
    @recipe_food = RecipeFood.new(quantity: params[:recipe_food][:quantity], food_id: params[:recipe_food][:food_id], recipe_id: @recipe.id)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to "/recipes/#{@recipe.id}", notice: 'Recipe food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    @recipe = Recipe.find(params[:recipe_food][:recipe_id])
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to "/recipes/#{@recipe.id}", notice: 'Recipe food was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    placeholder = @recipe_food.recipe_id
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to "/recipes/#{placeholder}", notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
