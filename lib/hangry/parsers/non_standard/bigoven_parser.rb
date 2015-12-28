module Hangry
  module Parsers
    module NonStandard
      class BigOvenParser < DataVocabularyRecipeParser
        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'bigoven.com')
        end

        def parse_ingredients
          nodes_with_itemprop(:ingredients).map do |i|
            i.content.strip
          end
        end
      end
    end
  end
end

