module Hangry
  module Parsers
    module NonStandard
      class SouthernFoodParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          !CanonicalUrlParser.new(html).canonical_url.nil? && CanonicalUrlParser.new(html).canonical_url.include?('southernfood.about.com')
        end

        def parse_name
          node_with_itemprop("headline name").content
        end

        def parse_description
          recipe_ast.css(".expert-content-text").first.content.strip
        end

        def parse_instructions
          node_with_itemprop("recipeInstructions").css("li").map(&:content).join("\n")
        end

      end
    end
  end
end

