module Hangry
  class SchemaOrgRecipeParser < RecipeParser

    def self.root_selector
      '[itemtype="http://schema.org/Recipe"]'
    end

    private

    def node_with_itemprop(itemprop)
      nodes_with_itemprop(itemprop).first || NullObject.new
    end
    def nodes_with_itemprop(itemprop)
      recipe_ast ? recipe_ast.css("[itemprop = \"#{itemprop}\"]") : NullObject.new
    end
    def parse_author
      author_node = node_with_itemprop(:author)
      author = if author_node['itemtype'] == "http://schema.org/Person"
        author_node.css('[itemprop = "name"]').first['content']
      else
        author_node.content
      end
      clean_string author
    end
    def parse_cook_time
      parse_time(:cookTime)
    end
    def parse_description
      clean_string node_with_itemprop(:description).content
    end
    def parse_ingredients
      nodes_with_itemprop(:ingredients).map(&:content).map do |ingredient|
        # remove newlines and excess whitespace from ingredients
        clean_string ingredient
      end
    end
    def parse_instructions
      clean_string node_with_itemprop(:recipeInstructions).content
    end
    def parse_name
      clean_string node_with_itemprop(:name).content
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
      clean_string node_with_itemprop(:recipeYield).content
    end

  end

end
