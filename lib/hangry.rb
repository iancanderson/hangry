require "hangry/version"
require 'hangry/parser_class_selecter'
require 'hangry/recipe_attribute_cleaner'
require 'active_support/core_ext/object/blank'
require 'date'
require 'iso8601'
require "nokogiri"

module Hangry
  RECIPE_ATTRIBUTES = [
    :author,
    :canonical_url,
    :cook_time,
    :description,
    :ingredients,
    :instructions,
    :name,
    :nutrition,
    :prep_time,
    :published_date,
    :total_time,
    :yield
  ]

  NUTRITION_ATTRIBUTES = [
    :calories,
    :cholesterol,
    :fiber,
    :protein,
    :saturated_fat,
    :sodium,
    :sugar,
    :total_carbohydrates,
    :total_fat,
    :trans_fat,
    :unsaturated_fat
  ]

  Recipe = Struct.new(*RECIPE_ATTRIBUTES)

  def self.parse(html)
    parser_class = ParserClassSelecter.new(html).parser_class
    recipe = parser_class.new(html).parse
    RecipeAttributeCleaner.new(recipe).clean
  end

end

