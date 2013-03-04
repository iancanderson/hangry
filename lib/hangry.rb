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
    :prep_time,
    :published_date,
    :total_time,
    :yield
  ]

  Recipe = Struct.new(*RECIPE_ATTRIBUTES)

  def self.parse(html)
    parser_classes = [SchemaOrgRecipeParser, HRecipeParser]
    parsers = parser_classes.map { |klass| klass.new(html) }
    parser = parsers.detect { |p| p.can_parse? }

    parser ? parser.parse : Recipe.new
  end

end

