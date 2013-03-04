require 'hangry'

describe Hangry do

  context "allrecipes.com recipe" do
    subject { Hangry.parse(File.read("spec/fixtures/allrecipes.html")) }
    
    its(:author) { should == "United Soybean Board" }
    its(:cook_time) { should == "PT15M" }
    its(:description) { should == "\"This better-for-you main-dish salad is quick, colorful and full of satisfying texture. To explore a variety of grains, substitute 3 cups cooked regular couscous, brown rice or quinoa.\"" }
    its(:ingredients) {
      should == [
        '3 cups broccoli florets, cut into 1/2-inch pieces',
        '1 red bell pepper, cut into 1-inch squares',
        '1 1/2 cups red onion, peeled and cut into 1/4-inch slices',
        '6 tablespoons soybean oil, divided (often labeled "vegetable oil")',
        '1/2 tablespoon ground black pepper, divided',
        '1/2 teaspoon salt, divided',
        '1 1/2 cups dry giant Israeli couscous',
        '2 tablespoons balsamic vinegar'
      ]
    }
    its(:name) { should == "Roasted Vegetable and Couscous Salad" }
    its(:instructions) { should == nil }
    its(:prep_time) { should == "PT15M" }
    its(:published_date) { should == nil }
    its(:total_time) { should == "PT30M" }
    its(:yield) { should == "6 servings" }

  end

end



