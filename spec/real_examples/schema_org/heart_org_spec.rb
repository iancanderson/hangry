# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "heart.org recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/heart.org.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == nil }
    its(:canonical_url) { should == nil }
    its(:cook_time) { should == nil }
    its(:description) { should == "In this one-skillet supper, we toss dark leafy greens, diced tomatoes and white beans with gnocchi and top it all with gooey mozzarella. Serve with a mixed green salad with vinaigrette." }
    its(:ingredients) { should == [] }
    its(:name) { should == "Skillet Gnocchi with Chard & White Beans" }
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
Heat 1 tablespoon oil in a large nonstick skillet over medium heat. Add gnocchi and cook, stirring often, until plumped and starting to brown, 5 to 7 minutes. Transfer to a bowl.Add the remaining 1 teaspoon oil and onion to the pan and cook, stirring, over medium heat, for 2 minutes. Stir in garlic and water. Cover and cook until the onion is soft, 4 to 6 minutes. Add chard (or spinach) and cook, stirring, until starting to wilt, 1 to 2 minutes. Stir in tomatoes, beans and pepper and bring to a simmer. Stir in the gnocchi and sprinkle with mozzarella and Parmesan. Cover and cook until the cheese is melted and the sauce is bubbling, about 3 minutes.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == nil }
    its(:yield) { should == "Serves: 6" }

  end

end

