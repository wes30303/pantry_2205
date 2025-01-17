require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe CookBook do
  before :each do
    @cookbook = CookBook.new
    @recipe2 = Recipe.new("Cheese Burger")
    @pantry = Pantry.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it "exist" do
    expect(@cookbook).to be_a(CookBook)
  end

  it "has an []" do
    expect(@cookbook.recipes).to eq([])
  end

  it "can add recipes" do
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
  end

  it "can check for ingredients" do
    @pantry = Pantry.new
    @cookbook = CookBook.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  # it "can check for the highest calorie meal " do
  #   @pantry = Pantry.new
  #   @cookbook = CookBook.new
  #   @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
  #   @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
  #   @recipe1 = Recipe.new("Mac and Cheese")
  #   @recipe1.add_ingredient(@ingredient1, 2)
  #   @recipe1.add_ingredient(@ingredient2, 8)
  #   @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
  #   @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
  #   @recipe2 = Recipe.new("Cheese Burger")
  #   @recipe2.add_ingredient(@ingredient1, 2)
  #   @recipe2.add_ingredient(@ingredient3, 4)
  #   @recipe2.add_ingredient(@ingredient4, 1)
  #   @cookbook.add_recipe(@recipe1)
  #   @cookbook.add_recipe(@recipe2)
  #   expect(@cookbook.highest_calorie_meal).to eq([@recipe2])
  # end

end
