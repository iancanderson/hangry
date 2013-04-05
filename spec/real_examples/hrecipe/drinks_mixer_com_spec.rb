# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "drinksmixer.com recipe" do
    let(:html) { File.read("spec/fixtures/drinksmixer.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == nil }
    its(:canonical_url) { should == nil }
    its(:cook_time) { should == nil }
    its(:description) { should == nil }
    its(:ingredients) {
      should == [
        "2 oz gin",
        "1 oz lemon juice",
        "1 tsp superfine sugar",
        "3 oz club soda",
        "1 maraschino cherry",
        "1 slice orange"
      ]
    }
    its(:name) { should == "Tom Collins recipe" }
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
In a shaker half-filled with ice cubes, combine the gin, lemon juice, and sugar. Shake well. Strain into a collins glass almost filled with ice cubes. Add the club soda. Stir and garnish with the cherry and the orange slice.
      eos
      should == instructions.strip
    }

    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == nil }
    its(:yield) { should == nil }

  end

end

