# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "cooking.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/cooking.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == nil }
    its(:canonical_url) { should == "http://www.cooking.com/recipes-and-more/recipes/garlic-shrimp-recipe-41.aspx" }
    its(:cook_time) { should == nil }
    its(:description) { should == "In Spanish tavernas, these shrimp; fragrant with garlic and olive oil; are brought to the table sizzling in a little metal pan. Have plenty of bread on hand to sop up the delicious pan juices. Serve with lemon wedges, if desired." }
    its(:image_url) { should == "http://target.scene7.com/is/image/Target/c_RC_837_rt_Garlic-Shrimp-RT" }
    its(:ingredients) {
      should == [
        "1/4 cup olive oil",
        "4 large cloves garlic, finely minced",
        "1 teaspoon red pepper flakes",
        "1 pound medium shrimp, peeled and deveined",
        "2 tablespoons fresh lemon juice",
        "2 tablespoons dry sherry",
        "1 teaspoon paprika",
        "Chopped fresh flat-leaf (Italian) parsley for garnish"
      ]
    }
    its(:name) { should == "Garlic Shrimp" }
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
In a sauté pan over medium heat, warm the olive oil. Add the garlic and red pepper flakes, and sauté for 1 minute. Raise the heat to high and add the shrimp, lemon juice, sherry and paprika. Stir well, then sauté, stirring briskly, until the shrimp turn pink and curl slightly, about 3 minutes. Season to taste with salt and freshly ground black pepper, and sprinkle with parsley. Serve hot.
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == 10 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 10 }
    its(:yield) { should == "Serves 4" }

  end

end



