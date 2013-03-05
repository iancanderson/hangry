module Hangry
  class RecipeParser
    attr_reader :recipe_html
    attr_accessor :recipe_ast, :recipe

    def initialize(recipe_html)
      @recipe_html = recipe_html
      @recipe = Recipe.new
      doc = Nokogiri::HTML(recipe_html)
      self.recipe_ast = doc.css(self.class.root_selector).first
    end

    def parse
      RECIPE_ATTRIBUTES.each do |attribute|
        attr_value = value(send("parse_#{attribute}"))
        recipe.public_send("#{attribute}=", attr_value)
      end
      recipe
    end

    def can_parse?
      recipe_ast
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

    def clean_string(string)
      string.strip.gsub(/\s+/, ' ')
    end

    def parse_duration(iso8601_string)
      duration = ISO8601::Duration.new(iso8601_string)
      duration.hours.to_i * 60 + duration.minutes.to_i
    rescue ISO8601::Errors::UnknownPattern
      nil
    end

  end

end


