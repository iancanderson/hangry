module Hangry
  module Parsers
    module NonStandard
      class TasteOfHomeParser < HRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'tasteofhome.com')
        end

        def nodes_with_class(klass)
          super.reject { |node|
            # Taste of Home has nested elements with the 'ingredient' class.
            # So reject all nodes with a child that has the same class.
            node.css(".#{klass}").any?
          }
        end

      end
    end
  end
end

