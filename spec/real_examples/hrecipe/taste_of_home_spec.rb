# encoding: UTF-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "tasteofhome.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/tasteofhome.com.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::TasteOfHomeParser)
    end
    
    its(:author) { should == "" }
    its(:canonical_url) { should == 'http://www.tasteofhome.com/recipes/rhubarb-popover-pie' }
    its(:cook_time) { should == 20 }
    its(:description) { should == "This fabulous spring breakfast \"pie\" is also delicious when pineapple or even fresh strawberries are mixed in with the rhubarb filling. Yum!—Patricia Kile, Elizabethtown, Pennsylvania." }
    its(:image_url) { should == "//hostedmedia.reimanpub.com/TOH/Images/Photos/37/300x300/exps49051_HCA1864839B02_17_3bC.jpg" }
    its(:ingredients) {
      should == [
        "1/2 cup all-purpose flour",
        "1/4 teaspoon salt",
        "2 eggs",
        "1/2 cup 2% milk",
        "2 tablespoons butter",
        "FILLING:",
        "1-1/2 cups sliced fresh or frozen rhubarb, thawed",
        "1/2 cup canned pineapple chunks",
        "1/3 cup butter, cubed",
        "1/2 cup packed brown sugar",
        "Whipped cream or vanilla ice cream, optional"
      ]
    }
    its(:name) { should == "Rhubarb Popover Pie Recipe" }
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
In a large bowl, combine flour and salt. In another bowl, whisk eggs and milk.
Place butter in an 9-in. pie plate; heat in a 425° oven for 3-5 minutes or until butter is melted. Meanwhile, stir egg mixture into dry ingredients just until moistened.
Carefully swirl the butter in the pan to coat the sides and bottom of pan; add batter. Bake at 425° for 16-20 minutes or until puffed and golden brown.
Meanwhile, in a large skillet, saute rhubarb and pineapple in butter until rhubarb is tender. Stir in brown sugar; bring to a boil over medium heat, stirring constantly. Pour into the center of puffed pancake; cut into six wedges. Serve immediately with whipped cream if desired.
Yield: 6 servings.      
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == 25 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 45 }
    its(:yield) { should == "6 servings" }

  end

end


