# encoding: utf-8
require 'hangry'
require "rspec/its"

describe Hangry do

  context "bigoven.com recipe" do

    let(:html) { File.read("spec/fixtures/hrecipe/bigoven.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::BigOvenParser)
    end

    its(:author) do
      should == "StevesKitchen"
    end
    its(:canonical_url) { should == "http://www.bigoven.com/recipe/steves-fish-tacos/178920" }
    its(:cook_time) { should == nil }
    its(:description) { should == "I had never tried fish tacos until my son, fresh out of boot camp, asked me to make them. I found a basic recipe, then adapted it from there, and now it's one of my favorite things to eat! \"It means little that I think these are the best fish tacos ever. It's a whole different matter that my husband (a devoted fish-taco lover) thinks they're the best. He says the search is over--these are the ones. Thanks, Steve\" - Jankrische" }
    its(:image_url) { should == 'http://images.bigoven.com/image/upload/t_recipe-256/steves-fish-tacos-2.jpg' }
    its(:ingredients) {
      should == [
        "1 package of tortillas; small", "0.5 cup sour cream", "0.25 cup salsa; favorite", "1 Salt", "1 Pepper",
        "1 pound Cod; Flounder or Haddock work too", "1 egg", "2 tablespoons milk", "1 tablespoon Flour",
        "1 tablespoon corn meal", "2 tablespoons of olive oil; you could use peanut oil or butter also",
        "2 limes; fresh, you'll use the juice", "1 tablespoon cider vinegar", "1 red onion; small; diced",
        "1 tomato; diced", "2 cups red cabbage; shredded", "cilantro; chopped fine; optional", "Jalapenos; optional",
        "Seasoning mix", "1 Ground Cumin", "1 Ground Coriander", "Hot sauce"
      ]
    }
    its(:instructions) do
      instructions = <<-eos
      As with any recipe, adaptation to your taste is the key to success and your culinary enjoyment.
This recipe is a preparation of optional ingredients, then you build the tacos as you like them.
1. Cut across the cabbage on the end opposite the stem in 1/4 inch rounds, then turn the rings and cut again to shred into small bite size pieces. Place the cabbage in a gallon freezer bag. Add 1 tablespoon of lime juice, the vinegar and season with salt pepper, cumin and coriander as you like. Shake the bag every direction to mix the ingredients and let sit while you prepare everything else.
2. For the fish - Cut the fish into fillets that you will later pull apart with two forks. Mix the egg and milk together. Mix the flour and cornmeal, and add seasonings that you like. I have a 22 herb/spice mix that I've come up with that I mix in with the flour and corn meal. Coriander, cumin, salt and pepper, garlic and onion powder are a good start. I'll post the mix as a separate recipe.
3. Bathe the fish in the mile/egg mixture, and dredge in the flour/seasoning mixture on both sides. Set aside until all the fish is ready.
4. Heat the oil or butter in a pan on medium high, and cook the fish, about 4 minutes per side. Take the fish out of the pan with tongs, set on a cutting board and squeeze lime juice over it. Let it cool.
5. Prepare the tomato, onion and cilantro and set out in small bowls. Mix the salsa of your choice and sour cream.
6. When the fish has cooled, use one fork to anchor it and shred with the another, flaking off small pieces. Place in a bowl.
7. Set out the cabbage in a small bowl.
8. Heat the tortillas in a microwave. Place two on a plate, and build up your tacos with sour cream mix, fish, onion, tomato, tomato, jalapenos, hot sauce - whatever you like!
Fold over and dig in, with a nice IPA or crisp white wine!
      eos
      #should == instructions.strip
      should_not == nil
    end
    its(:name) { should == "Steve's Fish Tacos" }
    its(:nutrition) {
      should == {
        calories: nil,
        cholesterol: nil,
        fiber: nil,
        protein: nil,
        saturated_fat: nil,
        sodium: nil,
        sugar: nil,
        total_carbohydrates: nil,
        total_fat: nil,
        trans_fat: nil,
        unsaturated_fat: nil
      }
    }
    its(:prep_time) { should == nil }
    its(:published_date) { should == Date.parse("2010-02-02") }
    its(:total_time) { should == 45 }
    its(:yield) { should == "6 Servings" }

  end

end





