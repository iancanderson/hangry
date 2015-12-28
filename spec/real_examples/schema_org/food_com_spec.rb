# encoding: UTF-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "food.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/food.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == "flume027" }
    its(:canonical_url) { should == "http://www.food.com/recipe/panda-express-orange-chicken-103215" }
    its(:cook_time) { should == 30 }
    its(:description) { should == "A copycat recipe from Panda Express. This chicken is tangy and flavorful. Give it a try! I'm sure you and your family will enjoy it." }
    its(:image_url) { should == "http://img.sndimg.com/food/image/upload/w_614,h_461,c_fit/v1/img/recipes/10/32/15/pic7atxk2.jpg" }
    its(:ingredients) {
      should == [
        "2 lbs boneless skinless chicken, chopped into bite sized pieces", 
        "1 egg", 
        "1 1⁄2 teaspoons salt", 
        "white pepper", 
        "oil (for frying)", 
        "1⁄2 cup cornstarch, plus", 
        "1 tablespoon cornstarch", 
        "1⁄4 cup flour", 
        "1 tablespoon gingerroot, minced", 
        "1 teaspoon garlic, minced", 
        "1⁄2 teaspoon crushed hot red chili pepper", 
        "1⁄4 cup green onion, chopped", 
        "1 tablespoon rice wine", 
        "1⁄4 cup water", 
        "1⁄2 teaspoon sesame oil", 
        "1 1⁄2 tablespoons soy sauce", 
        "1 1⁄2 tablespoons water", 
        "5 tablespoons sugar", 
        "5 tablespoons white vinegar", 
        "1 orange, zest of"
      ]
    }
    its(:name) { should == "Panda Express Orange Chicken" }
    its(:nutrition) do
      should == {
        calories: '305',
        cholesterol: '128.1',
        fiber: '0.4',
        protein: '34.4',
        saturated_fat: '1.2',
        sodium: '1023.8',
        sugar: '10.8',
        total_carbohydrates: '26.6',
        total_fat: '5.2',
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end

    its(:instructions) {
      instructions = <<-EOS
Place chicken pieces in large bowl.\nStir in egg, salt, pepper and 1 tablespoon oil and mix well.\nStir cornstarch and flour together.\nCoat with egg mixture.\nCoat with flour mixture.\nAdd chicken pieces, stirring to coat.\nHeat oil for deep-frying in wok or deep-fryer to 375 degrees.\nAdd chicken, small batches at a time, and fry 3 to 4 minutes or until golden crisp.\n(Do not overcook chicken).\nRemove chicken from oil with slotted spoon and drain on paper towels; set aside.\nClean wok and heat 15 seconds over high heat.\nAdd 1 tablespoon oil.\nAdd ginger and garlic and stir-fry until fragrant; about 10 seconds.\nAdd and stir-fry crushed chiles and green onions.\nAdd rice wine and stir 3 seconds.\nAdd Orange Sauce and bring to boil.\nAdd cooked chicken, stirring until well mixed.\nStir water into remaining 1 tablespoon cornstarch until smooth and add to chicken.\nHeat until sauce is thickned.\nStir in sesame oil and orange zest if desired.\nServe over jasmine rice.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == Date.parse("2004-11-02") }
    its(:total_time) { should == 45 }
    its(:yield) { should == "1 (228 g)" }

  end

end

