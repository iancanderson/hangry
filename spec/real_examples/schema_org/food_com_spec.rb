# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "food.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/food.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == "flume027" }
    its(:canonical_url) { should == "http://www.food.com/recipe/panda-express-orange-chicken-103215" }
    its(:cook_time) { should == 30 }
    its(:description) { should == "A copycat recipe from Panda Express. This chicken is tangy and flavorful. Give it a try! I'm sure you and your family will enjoy it." }
    its(:ingredients) {
      should == [
        "2 lbs boneless skinless chicken, chopped into bite sized pieces",
        "1 egg",
        "1 1/2 teaspoons salt",
        "white pepper",
        "oil (for frying)",
        "1/2 cup cornstarch, plus",
        "1 tablespoon cornstarch",
        "1/4 cup flour",
        "1 tablespoon gingerroot, minced",
        "1 teaspoon garlic, minced",
        "1/2 teaspoon crushed hot red chili pepper",
        "1/4 cup green onion, chopped",
        "1 tablespoon rice wine",
        "1/4 cup water",
        "1/2 teaspoon sesame oil",
        "1 1/2 tablespoons soy sauce",
        "1 1/2 tablespoons water",
        "5 tablespoons sugar",
        "5 tablespoons white vinegar",
        "1 orange, zest of"
      ]
    }
    its(:name) { should == "Panda Express Orange Chicken" }
    its(:nutrition) do
      should == {
        calories: '304.9',
        cholesterol: '128.0',
        fiber: '0.4',
        protein: '34.4',
        saturated_fat: '1.1',
        sodium: '1023.8',
        sugar: '10.7',
        total_carbohydrates: '26.6',
        total_fat: '5.1',
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end

    its(:instructions) {
      instructions = <<-EOS
1
Place chicken pieces in large bowl.
2
Stir in egg, salt, pepper and 1 tablespoon oil and mix well.
3
Stir cornstarch and flour together.
4
Mix flour mixture and egg mixture.
5
Add chicken pieces, stirring to coat.
6
Heat oil for deep-frying in wok or deep-fryer to 375 degrees.
7
Add chicken, small batches at a time, and fry 3 to 4 minutes or until golden crisp.
8
(Do not overcook chicken).
9
Remove chicken from oil with slotted spoon and drain on paper towels; set aside.
10
Clean wok and heat 15 seconds over high heat.
11
Add 1 tablespoon oil.
12
Add ginger and garlic and stir-fry until fragrant; about 10 seconds.
13
Add and stir-fry crushed chiles and green onions.
14
Add rice wine and stir 3 seconds.
15
Add Orange Sauce and bring to boil.
16
Add cooked chicken, stirring until well mixed.
17
Stir water into remaining 1 tablespoon cornstarch until smooth and add to chicken.
18
Heat until sauce is thickned.
19
Stir in sesame oil and orange zest if desired.
20
Serve over jasmine rice.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == Date.parse("2004-11-02") }
    its(:total_time) { should == 45 }
    its(:yield) { should == "1 (228 g)" }

  end

end

