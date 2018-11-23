require 'json'
require 'open-uri'

puts 'DL Ingredients from thecocktaildb ........'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = open(url).read
ingredients_raw = JSON.parse(response)

puts 'Creating ingredients ...............'

ingredients_raw['drinks'].each do |element|
  ingredient_name = element.values[0]

  Ingredient.create(name: ingredient_name)
end

puts 'Finished ..............!'

puts 'Creating cocktails ...............'

cocktails = [
  'Mojito',
  'Martini',
  'Bloody Mary',
  'Margarita',
  'Daiquiri',
  'Gin & Tonic',
  'Moscow Mule',
  'White Russian'
]

cocktails.each do |cocktail|
  Cocktail.create(name: cocktail)
end

puts 'Finished ..............!'
