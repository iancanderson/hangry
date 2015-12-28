require 'hangry'
require 'rspec/its'

describe Hangry do

  context "standard food network recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/food_network_schema_org.html") }
    subject { Hangry.parse(html) }
    
    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::FoodNetworkParser)
    end

    its(:canonical_url) { should == 'http://www.foodnetwork.com/recipes/rachael-ray/spinach-and-mushroom-stuffed-chicken-breasts-recipe.html' }
    its(:cook_time) { should == 20 }
    its(:description) { should == nil }
    its(:image_url) { should == 'http://foodnetwork.sndimg.com/content/dam/images/food/unsized/Rachel_Ray.jpg.rend.sni2col.jpeg' }
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
Recipe courtesy Rachael Ray
      instructions
      should == instructions.strip
    end

    its(:name) { should == "Spinach and Mushroom Stuffed Chicken Breasts" }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == Date.parse("2014-12-16") }
    its(:total_time) { should == 35 }
    its(:yield) { should == "4 servings" }

    it 'should parse the name of a schema.org Person when they are the author' do
      expect(subject.author).to eq('Rachael Ray')
    end

  end

  context "food network recipe with some blank ingredients" do
    subject { Hangry.parse(File.read("spec/fixtures/schema_org/food_network_with_blank_ingredients.html")) }

    its(:canonical_url) { should == 'http://www.foodnetwork.com/recipes/food-network-kitchens/easter-bunny-cake-recipe.html' }
    its(:cook_time) { should == nil }
    its(:description) { should == nil }
    its(:image_url) { should == "http://foodnetwork.sndimg.com/content/dam/images/food/unsized/2013/11/25/0/FN-Avatar-FN-Logo-126x126.png.rend.sni2col.png" }
    its(:ingredients) do
      should == [
        "3 sticks (12 ounces) unsalted butter, at room temperature",
        "6 cups confectioners' sugar",
        "Pinch fine salt",
        "1 tablespoon vanilla extract",
        "2 to 3 tablespoons milk",
        "2 baked 9-inch round cake layers (your favorite recipe or a 18.25-ounce boxed cake mix)",
        "1 1/4 cup sweetened flaked coconut",
        "2 store-bought biscotti",
        "1 tube pink decorating icing",
        "2 black jelly beans",
        "2 marshmallows",
        "1 white jelly bean, halved lengthwise",
        "1 pink jelly bean",
        "1 black licorice wheel, such as Haribo"
      ]
    end
    it "should filter out blank ingredients" do
      expect(subject.ingredients).not_to include ""
    end

    its(:instructions) do
      instructions = <<-instructions
For the frosting: Combine the butter, sugar and salt in the bowl of a stand mixer fitted with a paddle attachment (or in a large bowl if using a hand-held electric mixer). Mix on low speed until mostly incorporated. Add the vanilla, increase the speed to medium-high and mix until smooth. Adjust the consistency with milk until the frosting is easy to spread.
For the bunny: Spread a thin layer of frosting on the flat side of one cake layer, about 2/3 cup, and top with the flat side of the second cake layer. Measure 5 inches across the top of the cake and cut down through the layers, creating two layered pieces that are slightly different sizes.
Place the larger piece of cake, cut-side down, on a large platter or cake board. If using a rectangular cake board, place the larger piece so that the long edges are parallel with the long edges of the board. This is the body of the bunny. Cut the smaller piece of cake in half crosswise, so you have two layered wedges. Place one wedge in front of the body, with one flat side on the board and the other flat side against the body. The curved side will be on top. Take a serrated knife and round off the sharp edges on top of the head. Cut the tip off (the nose) at a 45-degree angle. Reserve all scraps in a bowl.
Separate the layers of the remaining wedge of cake. These will be the back legs. Round the sharp edges of the cake wedges with your knife, and add to the scrap bowl. Place one piece on each side of the bunny, with one flat side down and the other flat side facing forward (the round side towards the back of the bunny), about 1-inch from the end of the bunny's body.
Mix the cake scraps in the bowl with a fork until mashed, and then pack into a ball with your hands. Place the ball behind the bunny's body and adhere with a dab of frosting. This is the bunny's tail.
Frost the entire bunny, tail and all, using 2 to 3 cups of the frosting, keeping some definition with the bunny parts, and frosting more generously around any sharp edges to give a rounded look to the bunny parts. Sprinkle the bunny with the coconut to fully cover. Gently pat to adhere.
Insert the biscotti between the head and body, pressing into the cake to secure them. These are the ears. Place the base of the ears close together at the center of the head and angle them out. Frost the front of each biscotti with some frosting. Then, using the pink decorating icing, frost a smaller strip in the center of each biscotti, going down to where the ears meet the head but not going all the way to the top.
To make the face, press a black jelly bean into each side of the head for the eyes. Cut one of the marshmallows into 3 circles, discard the middle piece, and press the 2 end circles, cut-sides-in, into the front of the face for the bunny cheeks. Take the white jelly bean halves and push them into face below the cheeks, round-sides-out, for the teeth. Place the pink jelly bean above for the nose.
Unroll the licorice wheel and cut 2 pieces about 1 1/2 inches long each. For each piece, peel the strips apart halfway down, and then cut each separated strip in half lengthwise so you end up with a piece looking a bit like a broom. Repeat with the second piece of licorice. Tuck each piece, with a dab of frosting, behind a marshmallow cheek, with the cut ends facing out, for the whiskers.
Cut the second marshmallow in half lengthwise. Make 3 slits in each half, going about halfway through (these are the toes), and place in front of the legs for the bunny's feet. Adhere the bottom of the feet with icing if necessary.
Cook's Note:
Take 2 1/2 sheets of parchment paper and cut in half. Line the edges of your cake board with these parchment rectangles so that they form a rectangle of open space in the middle. Build your cake on the edges of these pieces of parchment. When you are finished you can slide them away along with any excess icing and coconut.
Make sure your cakes are completely cooled before you being to ice and cut them.
Food Network Kitchens
      instructions
      should == instructions.strip
    end

    its(:name) { should == "Easter Bunny Cake" }
    its(:prep_time) { should == 60 }
    its(:published_date) { should == Date.parse("2014-12-17") }
    its(:total_time) { should == 60 }
    its(:yield) { should == "12 to 14 servings" }

    it 'should parse the name of a schema.org Person when they are the author' do
      expect(subject.author).to eq('Food Network Kitchen')
    end

  end
end


