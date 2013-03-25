module Hangry
  class DefaultRecipeParser < RecipeParser
    def self.can_parse?(html)
      true
    end

    def initialize(html)
    end

    def parse
      Recipe.new
    end
  end
end
