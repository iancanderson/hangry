module Hangry
  module Parsers
    module NonStandard
      class AllRecipesParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'allrecipes.com')
        end

        def parse_instructions
          recipe_ast.css('.directions ol').first.content
        end

      end
    end
  end
end
