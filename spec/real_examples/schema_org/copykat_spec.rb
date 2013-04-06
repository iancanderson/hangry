# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "copykat.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/copykat.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == "Stephanie Manley via CopyKat.com" }
    its(:canonical_url) { should == "http://www.copykat.com/2013/03/13/mcdonalds-shamrock-shake/" }
    its(:cook_time) { should == 10 }
    its(:description) { should == "Make this McDonald's menu item any time of year." }
    its(:image_url) { should == "http://wm9zf27f67bdwwhm.zippykid.netdna-cdn.com/wp-content/uploads/2013/03/McDonalds-Shamrock-Shake-150x100.jpg" }
    its(:ingredients) {
      should == [
        "2 cups vanilla ice cream",
        "1/4 to 1/2 cup half and half",
        "4 to 6 drops mint oil (mint flavored extract is ok)",
        "2 to 3 drops green food coloring",
        "Whipped Cream"
      ]
    }
    its(:name) { should == "McDonald's Shamrock Shake" }
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
Allow ice cream to soften for about 10 minutes so it will be easy to blend. Combine all ingredients in a blender and puree for about 30 seconds. Serve immediately. Top with whipped cream.
Note: If you want to go dye free, omit the green food coloring, it tastes just the same without the food coloring.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == 10 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 20 }
    its(:yield) { should == "1" }

  end

end

