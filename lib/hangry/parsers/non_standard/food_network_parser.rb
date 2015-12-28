module Hangry
  module Parsers
    module NonStandard
      class FoodNetworkParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'foodnetwork.com')
        end

        def parse_instructions
          node_with_itemprop(:recipeInstructions).css("p").map(&:content).join("\n")
        end

      end
    end
  end
end

