module Hangry
  class HRecipeParser < RecipeParser

    def self.root_selector
      '.hrecipe'
    end

    private

    def node_with_class(klass)
      nodes_with_class(klass).first || NullObject.new
    end

    def nodes_with_class(klass)
      recipe_ast.css(".#{klass}")
    end

    def parse_author
      clean_string node_with_class(:author).content
    end

    def parse_cook_time
      parse_duration node_with_class(:cookTime).css('.value-title').first['title']
    end

    def parse_description
      clean_string node_with_class(:summary).content
    end

    def parse_ingredients
      nodes_with_class(:ingredient).map(&:content).map { |ingredient| clean_string ingredient }
    end

    def parse_instructions
      clean_string node_with_class(:instructions).content
    end

    def parse_name
      clean_string node_with_class(:fn).content
    end

    def parse_prep_time
      parse_duration node_with_class(:prepTime).css('.value-title').first['title']
    end

    def parse_published_date
      #TODO
    end

    def parse_total_time
      node = value(node_with_class(:duration)) || value(node_with_class(:totalTime))
      parse_duration node.css('.value-title').first['title']
    end

    def parse_yield
      clean_string node_with_class(:yield).content
    end

  end

end

