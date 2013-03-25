module Hangry
  class CanonicalUrlParser

    attr_accessor :nokogiri_doc

    def initialize(html_or_nokogiri_doc)
      self.nokogiri_doc = case html_or_nokogiri_doc
      when String
        Nokogiri::HTML(html_or_nokogiri_doc)
      when Nokogiri::HTML::Document
        html_or_nokogiri_doc
      else
        raise ArgumentError
      end
    end

    def canonical_domain
      canonical_url ? URI.parse(canonical_url).host : nil
    end

    def canonical_url
      node = nokogiri_doc.css('link[rel="canonical"]').first
      return node['href'] if node

      # Fall back to open graph URL (see food network example)
      node = nokogiri_doc.css('meta[property="og:url"]').first
      node ? node['content'] : nil
    end

  end
end
