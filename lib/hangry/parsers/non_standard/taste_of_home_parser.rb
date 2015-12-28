module Hangry
  module Parsers
    module NonStandard
      class TasteOfHomeParser < SchemaOrgRecipeParser

        def self.root_selector
          '[itemtype="http://schema.org/recipe"]'
        end

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'tasteofhome.com')
        end

        def parse_yield
          value(node_with_itemprop(:recipeyield).content)
        end

        def parse_instructions
          # => rd_directions.rd_ingredient each
          recipe_ast.css(".rd_directions").first.css(".rd_ingredient").map(&:content).join("\n")
        end

      end
    end
  end
end

