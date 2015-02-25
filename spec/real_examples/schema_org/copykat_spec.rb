# encoding: UTF-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "copykat.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/copykat.com.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::CopykatParser)
    end

    its(:author) { should == "Stephanie Manley via CopyKat.com" }
    its(:canonical_url) { should == "http://www.copykat.com/2014/12/03/low-fat-scalloped-potatoes/" }
    its(:cook_time) { should == 40 }
    its(:description) { should == "Enjoy these low fat scalloped potatoes. These are so tasty you won't even miss the butter and cream." }
    its(:image_url) { should == "http://www.copykat.com/wp-content/uploads/2014/12/swansons-finished-low-fat-scalloped-potatoes-150x100.jpg" }
    its(:ingredients) {
      should == [
        "1 pound Russet potatoes", 
        "Non-stick spray", 
        "1 teaspoon salt", 
        "1/2 teaspoon freshly ground black pepper", 
        "1 (26.1 ounces) box Low Fat Swanson's Cream Starter TM", 
        "1 cup Cheddar cheese, optional"
      ]
    }
    its(:name) { should == "Low Fat Scalloped Potatoes" }
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
Preheat oven to 350 degrees. Wash potatoes, and if desired peel before slicing. Spray an 8 x 8 inch baking dish with non-stick spray. Layer potatoes into baking dish, overlapping each slice over the previous one. When the bottom of the pan is covered, lightly season with salt and pepper. Continue layers until all of the potatoes are in the pan. Pour Swanson's Low Fat Cream Starter over the potatoes. Bake potatoes for about 30 minutes. Sprinkle cheese on potatoes and bake until the cheese is melted. Enjoy!
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 55 }
    its(:yield) { should == "6" }

  end

end

