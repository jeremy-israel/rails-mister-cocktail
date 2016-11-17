# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails = JSON.parse(open(url).read)
cocktails_array = cocktails["drinks"].map { |h_ingredient| h_ingredient["strIngredient1"] }

cocktails_array.uniq.each do |cocktail|
  if cocktail != ""
    a = Ingredient.create!(name: cocktail)
  end
end
