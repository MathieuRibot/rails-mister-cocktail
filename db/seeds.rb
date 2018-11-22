require 'json'
require 'open-uri'

puts 'DL Ingredients from thecocktaildb ........'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = open(url).read
ingredients_raw = JSON.parse(response)

puts 'Creating ingredients ...............'

ingredients_raw['drinks'].each do |element|
  ingredient_name = element.values[0]
  # puts ingredient_name
  # puts ingredient_name.class
  Ingredient.create(name: ingredient_name)
end

puts 'Finished ..............!'
