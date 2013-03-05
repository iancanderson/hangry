require "hangry/version"
require 'hangry/recipe_parser'
require 'hangry/hrecipe_parser'
require 'hangry/schema_org_recipe_parser'
require 'active_support/core_ext/object/blank'
require 'date'
require 'iso8601'
require "nokogiri"

module Hangry
  RECIPE_ATTRIBUTES = [
    :author,
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
    parser_classes = [SchemaOrgRecipeParser, HRecipeParser]
    parsers = parser_classes.map { |klass| klass.new(html) }
    parser = parsers.detect { |p| p.can_parse? }

    parser ? parser.parse : Recipe.new
  end

end

