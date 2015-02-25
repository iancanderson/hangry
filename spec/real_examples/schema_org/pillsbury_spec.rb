# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "pillsbury.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/pillsbury.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == nil }
    its(:canonical_url) { should == "http://www.pillsbury.com/recipes/big-cheesy-pepperoni-pockets/a17766e6-30ce-4a0c-af08-72533bb9b449" }
    its(:cook_time) { should == nil }
    its(:description) { should == "Enjoy these cheesy pepperoni hand pies made using Pillsbury® Big & Flaky dinner rolls – a delicious dinner that’s ready in 25 minutes." }
    its(:image_url) { should == 'http://s3.amazonaws.com/gmi-digital-library/6e04c5d1-8b2c-41aa-83e3-7dac9cb3ca40.jpg' }
    its(:ingredients) {
      should == [
        "1 can (12 oz) Pillsbury™ Grands ®! Big & Flaky crescent dinner rolls",
        "4 tablespoons marinara sauce",
        "64 slices pepperoni (5 oz)",
        "1 1/3 cups shredded mozzarella cheese (5 oz)",
        "1/4 teaspoon Italian seasoning"
      ]
    }
    its(:name) { should == "Big & Cheesy Pepperoni Pockets" }
    its(:nutrition) do
      should == {
        calories: '590',
        cholesterol: '55 mg',
        fiber: '1 g',
        protein: '21 g',
        saturated_fat: '15 g',
        sodium: '1550 mg',
        sugar: '10 g',
        total_carbohydrates: '42 g',
        total_fat: '4 1/2',
        trans_fat: '1/2 g',
        unsaturated_fat: nil
      }
    end

    its(:instructions) {
      instructions = <<-EOS
1
Heat oven to 375°F. Separate dough into 4 rectangles. Place on ungreased cookie sheet. Press each to 7x5 inches, firmly pressing perforations to seal.
2
Spread 1 tablespoon marinara sauce on each rectangle to within 1/2 inch of edges. Place 8 slices of pepperoni in center of each rectangle; top with 1/3 cup cheese and 8 more slices pepperoni. Bring ends up over filling, overlapping about 1 inch. Press edges with fork to seal. Brush each sandwich with water, and sprinkle with Italian seasoning.
3
Bake 13 to 15 minutes or until golden brown. Immediately remove from cookie sheet. Serve warm.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == 25 }
    its(:yield) { should == "4" }

  end

end

