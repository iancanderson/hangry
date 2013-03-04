require "hangry/version"
require 'active_support/core_ext/object/blank'
require 'date'
require 'iso8601'
require "nokogiri"

module Hangry
  def self.parse(html)
    parse_schema_org_recipe(html)
  end

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

  def self.parse_schema_org_recipe(html)
    SchemaOrgRecipeParser.new(html).parse
  end

  class SchemaOrgRecipeParser
    attr_reader :recipe_html
    attr_accessor :recipe_ast, :recipe

    def initialize(recipe_html)
      @recipe_html = recipe_html
      @recipe = Recipe.new
      doc = Nokogiri::HTML(recipe_html)
      self.recipe_ast = doc.css('[itemtype="http://schema.org/Recipe"]').first
    end

    def parse
      RECIPE_ATTRIBUTES.each do |attribute|
        attr_value = value(send("parse_#{attribute}"))
        recipe.public_send("#{attribute}=", attr_value)
      end
      recipe
    end

    private

    class NullObject
      def method_missing(*args, &block)
        self
      end
      def blank?; true; end
      def present?; false; end
      def to_a; []; end
      def to_ary; []; end
      def to_s; ""; end
      def to_str; ""; end
      def to_f; 0.0; end
      def to_i; 0; end
    end

    def value(object)
      case object
      when NullObject then nil
      else object
      end
    end

    def node_with_itemprop(itemprop)
      nodes_with_itemprop(itemprop).first || NullObject.new
    end
    def nodes_with_itemprop(itemprop)
      recipe_ast ? recipe_ast.css("[itemprop = \"#{itemprop}\"]") : NullObject.new
    end
    def parse_author
      author_node = node_with_itemprop(:author)
      if author_node['itemtype'] == "http://schema.org/Person"
        author_node.css('[itemprop = "name"]').first['content']
      else
        author_node.content
      end
    end
    def parse_cook_time
      parse_time(:cookTime)
    end
    def parse_description
      node_with_itemprop(:description).content
    end
    def parse_ingredients
      nodes_with_itemprop(:ingredients).map(&:content).map do |ingredient|
        # remove newlines and excess whitespace from ingredients
        ingredient.strip.gsub(/\s+/, ' ')
      end
    end
    def parse_instructions
      node_with_itemprop(:recipeInstructions).content.strip
    end
    def parse_name
      node_with_itemprop(:name).content
    end
    def parse_prep_time
      parse_time(:prepTime)
    end
    def parse_published_date
      content = node_with_itemprop(:datePublished)['content']
      content.blank? ? nil : Date.parse(content)
    end
    def parse_time(type)
      node = node_with_itemprop(type)
      iso8601_string = if node['content'].present?
        node['content']  # foodnetwork.com
      else
        node['datetime'] # allrecipes.com
      end
      duration = ISO8601::Duration.new(iso8601_string)
      duration.hours.to_i * 60 + duration.minutes.to_i
    rescue ISO8601::Errors::UnknownPattern
      nil
    end
    def parse_total_time
      parse_time(:totalTime)
    end
    def parse_yield
      node_with_itemprop(:recipeYield).content
    end

  end
end

