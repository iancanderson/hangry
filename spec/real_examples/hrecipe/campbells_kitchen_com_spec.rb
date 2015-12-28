# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "campbellskitchen.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/campbellskitchen.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == nil }
    its(:canonical_url) { should == "http://www.campbellskitchen.com/recipes/savory-white-beans-spinach-60821" }
    its(:cook_time) { should == 10 }
    its(:description) { should == "The beans are white, the greens are spinach...and the dish is delicious (and ready in 30 minutes)!" }
    its(:image_url) { should == 'http://www.campbellskitchen.com/recipeimages/savory-white-beans-spinach-large-60821.jpg' }
    its(:ingredients) {
      should == [
        "1 tablespoon olive oil",
        "1 medium onion , minced (about 1 cup)",
        "1/4 teaspoon crushed red pepper",
        "1 packet Swanson® Flavor Boost™ Concentrated Vegetable Broth",
        "1 package (about 6 ounces) baby spinach (about 8 cups)",
        "1 can (about 15 ounces) canned white cannellini beans , rinsed and drained",
        "1/4 cup grated Parmesan cheese",
        "6 ounces (about 1 cup) ditalini (small tube shaped) pasta , cooked and drained"
      ]
    }
    its(:name) { should == "Savory White Beans & Spinach" }
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
      instructions = <<-eos
1
Heat the oil in a 12-inch skillet over medium heat.  Add the onion and cook until tender, stirring occasionally.  Stir in the red pepper, concentrated broth and spinach.  Cover and cook until the spinach is wilted.
2
Add the beans, cheese and pasta and toss to coat.
      eos
      should == instructions.strip
    }

    its(:prep_time) { should == 20 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 30 }
    its(:yield) { should == "4" }

  end

end


