# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "mrfood.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/mrfood.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == nil }
    its(:canonical_url) { should == nil }
    its(:cook_time) { should == nil }
    its(:description) { should == nil }
    its(:image_url) { should == "http://cf2.primecp.com/master_images/MrFood/Saucy-Italian-Pot-Roast-RE.jpg" }
    its(:ingredients) {
      should == [
        "1 (8-ounce) package sliced fresh baby Portobello mushrooms",
        "1 large onion, cut in half and sliced",
        "1 (2-1/2- to 3-pound boneless chuck roast, trimmed",
        "1 (1.6-ounce) package garlic-and-herb sauce mix",
        "1/2 teaspoon crushed red pepper",
        "2 (14-1/2-ounce) cans Italian-style diced tomatoes, undrained",
        "1 (8-ounce) can no-salt-added tomato sauce",
        "2 tablespoons cornstarch",
        "2 tablespoons water"
      ]
    }
    its(:name) { should == "Saucy Italian Pot Roast" }
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

    its(:instructions) { should == "" }

    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == nil }
    its(:yield) { should == nil }

  end

end

