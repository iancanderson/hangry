# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "grouprecipes.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/grouprecipes.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == nil }
    its(:canonical_url) { should == nil }
    its(:cook_time) { should == nil }
    its(:description) { should == nil }
    its(:image_url) { should == 'http://s1.grouprecipes.com/images/recipes/200/05383996f195c3c350a844fe062ef66a.jpg' }
    its(:ingredients) { should == ["chocolate wafer cookie", "orange juice", "butter", "bittersweet chocolate", "cream cheese", "mascarpone cheese", "sour cream", "brown sugar", "unsweetened cocoa powder", "cornstarch", "salt", "eggs"] }
    its(:name) { should == "Deep Dark Chocolate Cheesecake Recipe" }
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
      instructions = <<-eos
Crust
Preheat oven to 350°F. Butter a 9” springform pan and line the base with parchment.
Mix all the crust ingredients together well.
Press evenly onto the bottom (not the sides) of the prepared pan.
Bake just until set, about 6 minutes.
Set aside while preparing filling. Keep oven on.
Filling
Melt the chocolate in the microwave or over a pot of simmering water until smooth and glossy.
In a bowl, beat cheeses, sour cream, brown sugar, cocoa powder, cornstarch and salt until smooth. Blend in eggs, 1 at a time.
By hand, fold in the chocolate until just blended in, trying not to incorporate air.
Pour filling over crust and rap sharply on a countertop to dislodge air pockets.
Smooth the top and place in a deep roasting pan.
Pour boiling water into the roasting pan, about ½ way up the side of the springform.
Bake until center is just set and just appears dry, about 1 hour.
Turn the oven off and cool the cheesecake inside for 1 hour, then remove from the oven and waterbath and cool 1 hour on a rack.
Run a knife around the side of cake to loosen the ring, but do not remove it.
Cover loosely and chill overnight before removing the ring and slicing.
Serve with Raspberry Compote
      eos
      should == instructions.strip
    }

    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == nil }
    its(:yield) { should == nil }

  end

end

