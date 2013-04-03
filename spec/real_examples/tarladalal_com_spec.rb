# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "tarladalal.com recipe" do
    let(:html) { File.read("spec/fixtures/tarladalal.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == "Tarla Dalal" }
    its(:canonical_url) { should == nil }
    its(:cook_time) { should == 15 }
    its(:description) { should == "A Jain version of the all-time favourite veggie fried rice!" }
    its(:ingredients) {
      should == [
        "4 cups 80 % cooked Rice",
        "1/4 cup parboiled and sliced french beans",
        "1/2 cup sliced coloured capsicum (green, yellow andred)",
        "1/4 cup shredded cabbage",
        "1/4 cup thinly sliced baby corn",
        "2 tbsp chopped celery",
        "3 tsp Chinese 5 Spice Powder",
        "2 tbsp soy sauce",
        "1 tbsp chilli sauce",
        "2 tbsp oil",
        "salt to taste",
        "2 tbsp chopped coriander (dhania)"
      ]
    }
    its(:name) { should == "5 Spice Vegetable Fried Rice" }
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
Heat the oil in a wok over a high flame, add all vegetables and cook for 2 minutes on high flame.
Add in rice, 5 spice powder, soya sauce, chilli sauce and salt.
Mix well and cook for 5 minutes.
Serve hot.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == 20 }
    its(:published_date) { should == nil }
    its(:total_time) { should == nil }
    its(:yield) { should == "Serves 4." }

  end

end


