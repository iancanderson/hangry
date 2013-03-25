module Hangry
  module Parsers
    module NonStandard
      class AllRecipesParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'allrecipes.com')
        end

        def parse_instructions
          content = recipe_ast.css('.directions ol').first.content
          clean_string content, preserve_newlines: true
        end

      end
    end
  end
end
