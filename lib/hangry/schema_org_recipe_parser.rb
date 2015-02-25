module Hangry
  class SchemaOrgRecipeParser < RecipeParser

    def self.root_selector
      '[itemtype="http://schema.org/Recipe"]'
    end

    def self.nutrition_selector
      '[itemtype="http://schema.org/NutritionInformation"]'
    end

    def self.ingredient_itemprop
      :ingredients
    end

    private

    def node_with_itemprop(itemprop)
      nodes_with_itemprop(itemprop).first || NullObject.new
    end
    def nodes_with_itemprop(itemprop)
      recipe_ast ? recipe_ast.css("[itemprop = \"#{itemprop}\"]") : NullObject.new
    end
    def nutrition_node_with_itemprop(itemprop)
      return NullObject.new unless nutrition_ast
      nutrition_ast.css("[itemprop = \"#{itemprop}\"]").first || NullObject.new
    end
    def nutrition_property_value(itemprop)
      nutrition_node = nutrition_node_with_itemprop(itemprop)
      value = value(nutrition_node['content']) || value(nutrition_node.content)
      value ? value.strip : nil
    end
    def parse_author
      author_node = node_with_itemprop(:author)
      author = if author_node['itemtype'] == "http://schema.org/Person"
        #author_node.css('[itemprop = "name"]').first['content']
        author_node.css('[itemprop = "name"]').first.content
      else
        author_node.content
      end
      author
    end
    def parse_cook_time
      parse_time(:cookTime)
    end
    def parse_description
      node_with_itemprop(:description).content
    end
    def parse_image_url
      node = node_with_itemprop(:image)
      value(node['src']) || value(node['content'])
    end
    def parse_ingredients
      nodes_with_itemprop(self.class.ingredient_itemprop).map(&:content).map { |ingredient|
        # remove newlines and excess whitespace from ingredients
        ingredient
      }.reject(&:blank?)
    end
    def parse_instructions
      # => NOT THIS:
      #nodes_with_itemprop(:recipeInstructions).map(&:content).join("\n")
      inst = ""
      nodes_with_itemprop(:recipeInstructions).map { |i|
        inst += i.content.strip + "\n" unless inst.include?(i.content.strip)
      }
      inst 
    end
    def parse_name
      node_with_itemprop(:name).content
    end
    def parse_nutrition
      recipe.nutrition.tap do |nutrition|
        nutrition[:calories] = nutrition_property_value(:calories)
        nutrition[:cholesterol] = nutrition_property_value(:cholesterolContent)
        nutrition[:fiber] = nutrition_property_value(:fiberContent)
        nutrition[:protein] = nutrition_property_value(:proteinContent)
        nutrition[:saturated_fat] = nutrition_property_value(:saturatedFatContent)
        nutrition[:sodium] = nutrition_property_value(:sodiumContent)
        nutrition[:sugar] = nutrition_property_value(:sugarContent)
        nutrition[:total_carbohydrates] = nutrition_property_value(:carbohydrateContent)
        nutrition[:total_fat] = nutrition_property_value(:fatContent)
        nutrition[:trans_fat] = nutrition_property_value(:transFatContent)
        nutrition[:unsaturated_fat] = nutrition_property_value(:unsaturatedFatContent)
      end
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
      parse_duration(iso8601_string)
    end
    def parse_total_time
      parse_time(:totalTime)
    end
    def parse_yield
      value(node_with_itemprop(:recipeYield)['content']) ||
      value(node_with_itemprop(:recipeYield).content) ||
      NullObject.new
    end

  end

end
