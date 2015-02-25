module Hangry
  module Parsers
    module NonStandard
      class CopykatParser < SchemaOrgRecipeParser

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'copykat.com')
        end

        def parse_author
          # => all from her?
          "Stephanie Manley via CopyKat.com"
        end

      end
    end
  end
end
