# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "southernfood.about.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/southernfood.about.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == "Diana Rattray, About.com Guide" }
    its(:canonical_url) { should == "http://southernfood.about.com/od/collardgreens/r/Kale-Saute-Recipe.htm" }
    its(:cook_time) { should == nil }
    its(:description) { should == "This kale recipe is nutritious and delicious, and it's very easy to prepare and cook. There's very little fat in the recipe, and it can be reduced even further by using nonstick cooking spray and a little broth to saute the onion. I used the Portuguese hot crushed red peppers (wet, from jar) in this dish, but feel free to use fresh minced hot peppers for heat. Take a look at the large picture of this kale recipe." }
    its(:image_url) { should == "http://0.tqn.com/d/southernfood/1/I/r/Q/3/kale-saute-2.jpg" }
    its(:ingredients) {
      should == [
        "1 pound kale, large stems removed, chopped, cooked (or use frozen chopped kale)",
        "2 teaspoons olive oil",
        "1/2 cup finely chopped purple onion",
        "1 medium clove garlic, pressed",
        "1 or 2 hot peppers, minced, or 1 heaping tablespoon Portuguese crushed red peppers from a jar*",
        "3 tablespoons red wine vinegar",
        "1 tomato, chopped",
        "1/2 teaspoon salt, or to taste",
        "pepper, to taste"
      ]
    }
    its(:name) { should == "Sautéed Kale" }
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
To cook the kale, bring a pot of salted water to a boil. Add the chopped kale and boil for 10 to 15 minutes, or until stem portions are tender. Or, follow directions on the package if using frozen kale.
Heat olive oil in a large skillet over medium heat; cook onion until just tender. Add the garlic and cook, stirring, for 1 minute. Add crushed red peppers, kale, and vinegar; cook, stirring, for 1 minute longer. Add chopped tomato, salt, and pepper; heat through.
Serves 4 to 6.
*
Portuguese style wet crushed hot red peppers might be found in the ethnic or Spanish section. I found Pastene in my area, but if you can't find the crushed peppers, use any fresh hot chile pepper, finely chopped.
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == 25 }
    its(:yield) { should == "Serves 4 to 6" }

  end

end

