# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "taste.com.au recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/data-vocabulary_org/taste.com.au.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == "Sophia Young" }
    its(:canonical_url) { should == "/recipes/24586/lemon+melting+moments" }
    its(:cook_time) { should == 15 }
    its(:description) { should == "Take a trip down memory lane with these buttery biccies. They're great for teatime or with coffee for your next dinner party." }
    its(:image_url) { should == "http://cdn.taste.com.au/images/recipes/mc/2010/07/24586_l.jpg" }
    its(:ingredients) { should == [] }
    its(:name) { should == "Lemon melting moments" }
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

    its(:instructions) { should == nil }
    its(:prep_time) { should == nil }
    its(:published_date) { should == Date.parse("2010-07-01") }
    its(:total_time) { should == nil }
    its(:yield) { should == "20" }

  end

end

