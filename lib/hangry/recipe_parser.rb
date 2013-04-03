require 'hangry/canonical_url_parser'

module Hangry
  class RecipeParser
    attr_reader :recipe_html
    attr_accessor :nokogiri_doc, :nutrition_ast, :recipe_ast, :recipe

    def initialize(recipe_html)
      @recipe_html = recipe_html
      @recipe = Recipe.new
      initialize_nutrition
      self.nokogiri_doc = Nokogiri::HTML(recipe_html)
      self.recipe_ast = nokogiri_doc.css(self.class.root_selector).first
      self.nutrition_ast = recipe_ast && recipe_ast.css(self.class.nutrition_selector)
    end

    def parse
      RECIPE_ATTRIBUTES.each do |attribute|
        attr_value = value(send("parse_#{attribute}"))
        recipe.public_send("#{attribute}=", attr_value)
        next unless recipe.public_send(attribute).present?

        send("clean_#{attribute}", recipe) if respond_to? "clean_#{attribute}"
      end
      recipe
    end

    def self.can_parse?(html)
      new(html).recipe_ast
    end

    def self.canonical_url_matches_domain?(html, domain)
      CanonicalUrlParser.new(html).canonical_domain == domain
    end

    def clean_nutrition(recipe)
      recipe.nutrition.each do |key, value|
        next unless value
        recipe.nutrition[key] = clean_string value
      end
    end

    private

    class NullObject
      def method_missing(*args, &block)
        self
      end
      def blank?; true; end
      def present?; false; end
      def to_a; []; end
      def to_ary; []; end
      def to_s; ""; end
      def to_str; ""; end
      def to_f; 0.0; end
      def to_i; 0; end
    end

    def value(object)
      case object
      when NullObject then nil
      else object
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

    def initialize_nutrition
      recipe.nutrition = {}
      NUTRITION_ATTRIBUTES.each do |attribute|
        recipe.nutrition[attribute] = nil
      end
    end

    def parse_canonical_url
      CanonicalUrlParser.new(nokogiri_doc).canonical_url
    end

    def parse_duration(iso8601_string)
      duration = ISO8601::Duration.new(iso8601_string)
      duration.hours.to_i * 60 + duration.minutes.to_i
    rescue ISO8601::Errors::UnknownPattern
      nil
    end

  end

end


