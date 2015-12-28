# encoding: UTF-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "homecooking.about.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/homecooking.about.com.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::HomeCookingParser)
    end

    its(:author) { should == "By Peggy Trowbridge Filippone" }
    its(:canonical_url) { should == "http://homecooking.about.com/od/muffinrecipes/r/blmuff23.htm" }
    its(:cook_time) { should == 25 }
    its(:description) { should == "User Rating The combination of key limes and white chocolate is irresistable. Use this basic recipe for incredibly moist and delightfully tangy sweet muffins or cake." }
    its(:image_url) { should == "http://f.tqn.com/y/homecooking/1/W/G/C/1/blmuff23.jpg" }
    its(:ingredients) {
      should == [
        "Cupcakes/Cake:",
        "1-3/4 cups all-purpose flour",
        "2 teaspoons baking powder",
        "1/2 teaspoon salt",
        "6 Tablespoons butter, softened",
        "1 cup sugar",
        "2 large eggs, lightly beaten",
        "1-1/2 teaspoons grated key lime zest",
        "1 Tablespoon fresh key lime juice",
        "2/3 cup buttermilk",
        "1 cup white chocolate chips",
        ".",
        "Glaze:",
        "1 cup powdered sugar",
        "1/8 cup fresh key lime juice"
      ]
    }
    its(:name) { should == "White Chocolate Key Lime Muffins or Cake Recipe" }
    its(:nutrition) do
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
    end

    its(:instructions) {
      instructions = <<-EOS
Preparation
For Muffins:
Preheat oven to 350 degrees F (175 degrees C). Line standard-size muffin tin with foil liners.
Blend the flour, baking powder, and salt together in a small bowl. Set aside.
In a large mixing bowl, cream butter and sugar together with a mixer, beating until blended. Add the eggs, 1-1/2 teaspoons lime zest, and 1 tablespoon lime juice.
Into the butter-cream mixture in the large bowl, add 1/3 of the flour mixture, stirring until combined. Add one-third of the buttermilk, stirring until combined. Continue alternating one-third of each until all is mixed well. Fold in white chocolate chips.
Fill cupcake liners two-thirds full with batter. Bake 18 to 20 minutes (or 12 to 14 minutes for mini-muffins) until wooden pick inserted in the center comes out clean.
Glaze:
Whisk powdered sugar and 1/8 cup lime juice together until combined and smooth. While muffins are still warm, poke holes in the tops of the muffins with a wooden pick. Smooth about a teaspoon on top of each warm muffin. Cool completely.
Yield: about 18 muffins
For Cake:
Preheat oven to 350 degrees F (175 degrees C). Prepare 9 x 13-inch baking pan by lining with foil (non-stick foil recommended).
Follow the same mixing instructions as above. Spread batter evenly in pan. Bake 35 to 40 minutes or until wooden pick inserted in center comes out clean. Let rest in pan about 5 minutes and then poke holes all over the top of the cake with a wooden pick. Spread glaze evenly over top of cake and cool completely. Cut into 18 pieces to serve.
Yield: 18 servings
White Chocolate Key Lime Muffins or Cake Recipe Photo © 2008 Peggy Trowbridge Filippone, licensed to About.com, Inc.
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == 10 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 35 }
    its(:yield) { should == nil }

  end

end

