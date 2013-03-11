require 'hangry'

describe Hangry do

  context "food network recipe" do
    subject { Hangry.parse(File.read("spec/fixtures/food_network_schema_org.html")) }
    
    its(:cook_time) { should == 20 }
    its(:description) { should == nil }
    its(:ingredients) do
      should == [
        "4 boneless, skinless chicken breasts, 6 ounces",
        "Large plastic food storage bags or waxed paper",
        "1 package, 10 ounces, frozen chopped spinach",
        "2 tablespoons butter",
        "12 small mushroom caps, crimini or button",
        "2 cloves garlic, cracked",
        "1 small shallot, quartered",
        "Salt and freshly ground black pepper",
        "1 cup part skim ricotta cheese",
        "1/2 cup grated Parmigiano or Romano, a couple of handfuls",
        "1/2 teaspoon fresh grated or ground nutmeg",
        "Toothpicks",
        "2 tablespoons extra-virgin olive oil",
        "2 tablespoons butter",
        "2 tablespoons flour",
        "1/2 cup white wine",
        "1 cup chicken broth"
      ]
    end

    its(:instructions) do
      instructions = <<-instructions
Place breasts in the center of a plastic food storage bag or 2 large sheets of waxed paper. Pound out the chicken from the center of the bag outward using a heavy-bottomed skillet or mallet. Be firm but controlled with your strokes.
Defrost spinach in the microwave. Transfer spinach to a kitchen towel. Twist towel around spinach and wring it out until very dry. Transfer to a medium-mixing bowl.
Place a nonstick skillet over moderate heat. When skillet is hot, add butter, mushrooms, garlic and shallot. Season with salt and pepper and saute 5 minutes. Transfer mushrooms, garlic and shallot to the food processor. Pulse to grind the mushrooms and transfer to the mixing bowl, adding the processed mushrooms to the spinach. Add ricotta and grated cheese to the bowl and the nutmeg. Stir to combine the stuffing. Return your skillet to the stove over medium high heat.
Place a mound of stuffing on each breast and wrap and roll breast over the stuffing. Secure breasts with toothpicks. Add 3 tablespoons oil to the pan, 3 turns of the pan. Add breasts to the pan and brown on all sides, cooking chicken 10 to 12 minutes. The meat will cook quickly because it is thin. Remove breasts; add butter to the pan and flour. Cook butter and flour for a minute, whisk in wine and reduce another minute. Whisk in broth and return breasts to the pan. Reduce heat and simmer until ready to serve. Remove toothpicks. Serve breasts whole or, remove from pan, slice on an angle and fan out on dinner plates. Top stuffed chicken breasts or sliced stuffed breasts with generous spoonfuls of the sauce.
      instructions
      should == instructions.strip
    end

    its(:name) { should == "Spinach and Mushroom Stuffed Chicken Breasts" }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == Date.parse("2013-02-06") }
    its(:total_time) { should == 35 }
    its(:yield) { should == "4 servings" }

    it 'should parse the name of a schema.org Person when they are the author' do
      subject.author.should == 'Rachael Ray'
    end

  end

end


