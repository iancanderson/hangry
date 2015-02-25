module Hangry
  module Parsers
    module NonStandard
      class HomeCookingParser < SchemaOrgRecipeParser
        def self.can_parse?(html)
          !CanonicalUrlParser.new(html).canonical_url.nil? && CanonicalUrlParser.new(html).canonical_url.include?('homecooking.about.com')
        end

        def parse_description
          recipe_ast.css(".expert-content-text").first.content.strip
        end

        def parse_name
          node_with_itemprop("headline name").content
        end

      end
    end
  end
end