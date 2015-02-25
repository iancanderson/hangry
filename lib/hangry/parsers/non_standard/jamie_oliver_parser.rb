module Hangry
  module Parsers
    module NonStandard
      class JamieOliverParser < HRecipeParser

        def self.can_parse?(html)
          html.include?('jamieoliver.com')
        end

        def parse_description
          recipe_ast.css(".instructions").css("i").first.content
        end

        def parse_instructions
          recipe_ast.css(".content").css(".instructions").map(&:content).join("\n") 
        end
      end
    end
  end
end