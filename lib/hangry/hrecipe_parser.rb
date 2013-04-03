module Hangry
  class HRecipeParser < RecipeParser

    def self.nutrition_selector
      '.nutrition'
    end

    def self.root_selector
      '.hrecipe, .hRecipe'
    end

    private

    def node_with_class(klass)
      nodes_with_class(klass).first || NullObject.new
    end

    def nodes_with_class(klass)
      recipe_ast.css(".#{klass}")
    end

    def parse_author
      node_with_class(:author).content
    end

    def parse_cook_time
      parse_duration node_with_class(:cookTime).css('.value-title').first['title']
    end

    def parse_description
      node_with_class(:summary).content
    end

    def parse_ingredients
      nodes_with_class(:ingredient).map { |ingredient_node|
        # Instead of calling content on the node itself,
        # join together the content of the nodes' children.
        # This is to support BigOven's janky usage of spans with margin-lefts...
        ingredient_node.children.map { |c| c.content }.join(' ')
      }.map { |ingredient|
        ingredient
      }.reject(&:blank?)
    end

    def parse_instructions
      nodes_with_class(:instructions).map(&:content).join("\n")
    end

    def parse_name
      node_with_class(:fn).content
    end

    def parse_nutrition
      #TODO
      {
        calories: nil,
        cholesterol: nil,
        fiber: nil,
        protein: nil,
        saturated_fat: nil,
        sodium: nil,
        sugar: nil,
        total_carbohydrates: nil,
        total_fat: nil,
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end

    def parse_prep_time
      parse_duration node_with_class(:prepTime).css('.value-title').first['title']
    end

    def parse_published_date
      #TODO
    end

    def parse_total_time
      node = maybe(
        value(node_with_class(:duration)) ||
        value(node_with_class(:totalTime))
      )
      parse_duration node.css('.value-title').first['title']
    end

    def parse_yield
      node_with_class(:yield).content
    end

  end

end

