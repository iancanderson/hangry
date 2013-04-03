module Hangry
  class RecipeAttributeCleaner

    MULTILINE_ATTRIBUTES = [:instructions]

    attr_reader :recipe

    def initialize(recipe)
      @recipe = recipe
    end

    def clean
      RECIPE_ATTRIBUTES.each do |attribute|
        recipe.public_send("#{attribute}=", clean_attribute(recipe, attribute))
      end
      recipe
    end

    private

    def clean_attribute(recipe, attribute)
      value = recipe.public_send(attribute)
      clean_value(value, preserve_newlines: MULTILINE_ATTRIBUTES.include?(attribute))
    end

    def clean_value(value, options={})
      case value
      when String
        clean_string(value, options)
      when Array
        value.map { |string| clean_string(string, options) }
      when Hash
        value.each do |key, string|
          next unless string
          recipe.nutrition[key] = clean_string(string, options)
        end
      else
        value
      end
    end

    def clean_string(string, options={})
      preserve_newlines = options.fetch(:preserve_newlines, false)

      string.strip!                     # remove leading and trailing spaces
      if preserve_newlines
        string.gsub!(/\s*\n\s*/, "\n")  # replace any whitespace group with a newline with a single newline
        string.squeeze!(' ')            # consolidate duplicate spaces into a single space
      else
        string.gsub!(/\s+/, ' ')        # replace all consecutive whitespace with a single space
      end
      string
    end

  end
end
