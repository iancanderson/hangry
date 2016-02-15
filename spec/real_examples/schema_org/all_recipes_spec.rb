require 'hangry'
require 'rspec/its'

describe Hangry do

  context "allrecipes.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/allrecipes.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == 'United Soybean Board' }
    its(:canonical_url) { should == 'http://allrecipes.com/recipe/230347/roasted-vegetable-and-couscous-salad/'}
    its(:cook_time) { should == 15 }
    its(:description) { should == '"This better-for-you main-dish salad is quick, colorful and full of satisfying texture. To explore a variety of grains, substitute 3 cups cooked regular couscous, brown rice or quinoa."' }
    its(:image_url) { should == 'http://images.media-allrecipes.com/userphotos/250x250/987785.jpg' }
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
    its(:nutrition) do
      should == {
        calories: '305 kcal',
        cholesterol: '0 mg',
        fiber: nil,
        protein: '6.8 g',
        saturated_fat: nil,
        sodium: '217 mg',
        sugar: nil,
        total_carbohydrates: '38.3g',
        total_fat: '14.2 g',
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end
    its(:instructions) {
      instructions = <<-EOS
Preheat oven to 425 degrees F.
Toss broccoli, peppers and onions with 2 tablespoons soybean oil and 1/4 teaspoon each salt and pepper. Place on foil-lined baking sheet.
Bake for 15 minutes until vegetables are tender and lightly browned.
Meanwhile, cook couscous according to package directions.
Place cooked couscous and roasted vegetables in large bowl. Pour vinegar and remaining soybean oil over salad and sprinkle with remaining salt and pepper; toss lightly until combined.
You may substitute 3 cups cooked regular couscous, brown rice or quinoa.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 30 }
    its(:yield) { should == '6' }

  end

end
