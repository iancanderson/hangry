# Hangry

Parses microformatted recipe HTML into a plain-old-ruby Recipe object.

Currently supported microformats:
- http://schema.org/Recipe

Microformats to support in future versions:
- http://microformats.org/wiki/hrecipe

## Installation

Add this line to your application's Gemfile:

    gem 'hangry'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hangry

## Usage

```ruby
require 'open-uri'
recipe_url = "http://www.foodnetwork.com/recipes/rachael-ray/spinach-and-mushroom-stuffed-chicken-breasts-recipe/index.html"
recipe_html_string = open(recipe_url).read

recipe = Hangry.parse(recipe_html_string)
recipe.name   # "Spinach and Mushroom Stuffed Chicken Breasts"
recipe.yield  # "4 servings"
# etc..
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
