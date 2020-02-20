require 'json'
require 'open-uri'

puts 'Creating ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = URI.open(url).read
parsed_ingredients = JSON.parse(response)
ingredients = []
parsed_ingredients.each do |_key, value|
  ingredients = value
end

ingredients.each do |hash|
  Ingredient.create!(name: hash['strIngredient1'])
end

puts 'Ingredients created!'
