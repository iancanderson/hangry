module Hangry
  module Parsers
    module NonStandard
      class EatingWellParser < SchemaOrgRecipeParser

        def self.root_selector
          '[itemtype="http://schema.org/recipe"]'
        end

        def self.can_parse?(html)
          canonical_url_matches_domain?(html, 'eatingwell.com')
        end

        def parse_instructions
          content = nodes_with_itemprop(:recipeinstructions).map(&:content).join("\n")
          clean_string content, preserve_newlines: true
        end

        def parse_nutrition
          recipe.nutrition.tap do |nutrition|
            nutrition[:calories] = nutrition_property_value(:calories)
            nutrition[:cholesterol] = nutrition_property_value(:cholesterolcontent)
            nutrition[:fiber] = nutrition_property_value(:fibercontent)
            nutrition[:protein] = nutrition_property_value(:proteincontent)
            nutrition[:saturated_fat] = nutrition_property_value(:saturatedfatcontent)
            nutrition[:sodium] = nutrition_property_value(:sodiumcontent)
            nutrition[:sugar] = nutrition_property_value(:sugarcontent)
            nutrition[:total_carbohydrates] = nutrition_property_value(:carbohydratecontent)
            nutrition[:total_fat] = nutrition_property_value(:fatcontent)
            nutrition[:trans_fat] = nutrition_property_value(:transfatcontent)
            nutrition[:unsaturated_fat] = nutrition_property_value(:unsaturatedfatcontent)
          end
        end

        def parse_yield
          clean_string(
            value(node_with_itemprop(:recipeyield).content) ||
            NullObject.new
          )
        end

      end
    end
  end
end

