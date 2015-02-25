# encoding: UTF-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "jamieoliver.com recipe" do
    let(:html) { File.read("spec/fixtures/hrecipe/jamieoliver.com.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::JamieOliverParser)
    end

    its(:author) { should == "Jamie Oliver" }
    its(:canonical_url) { should == nil }
    its(:cook_time) { should == nil }
    its(:description) { should == "This is a boneless steak cut from the top of the pork shoulder. It doesn't have a rim of fat round the edge, but what it does have is a beautiful marbling of fat through the meat. This keeps the meat deliciously moist while it cooks. The steaks are probably best cooked on a ridged griddle, but you can also pan-fry or roast them. The garlic, sage and lemon add extra flavour to the meat, but don't worry if you don't have them, the dish will work just as well without. Prep time: 10 minutes Cook time: 10 minutes" }
    its(:image_url) { should == 'http://s3-eu-west-1.amazonaws.com/jamieoliverprod/_int/rdb2/upload/360_1_1349871789_lrg.jpg' }
    its(:ingredients) {
      should == [
        "4 higher-welfare pork neck fillet steaks",
        "olive oil",
        "2 cloves garlic, peeled and crushed",
        "1 handful fresh sage leaves, chopped",
        "sea salt",
        "freshly ground black pepper",
        "1 lemon"
      ]
    }
    its(:name) { should == "Neck fillet steak" }
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
Get your griddle pan on a high heat and let it get screaming hot. Lay the steaks out on a chopping board and drizzle a little olive oil over each one. Sprinkle over the garlic, sage, a good sprinkling of salt and lots of ground black pepper. Grate the zest of the lemon onto the steaks, then cut the lemon in two and squeeze one of the halves over them as well. Rub this marinade into both sides of each steak with your fingers so they are evenly oiled and seasoned.
Place the steaks on your griddle or in a hot frying-pan (they make a bit of smoke, so get your fan on!). Make sure you don't have too many in the pan at one time – there should be a gap between the steaks and they shouldn't be touching each other at all, so if your pan isn't big enough, cook in batches.
Turn the steaks over after two minutes, then turn every minute until they've had 8 minutes cooking time in total. Squeeze the other half of the lemon over the cooked steaks and let them sizzle for a moment, then lift them out of the pan with tongs to a plate to rest for a minute before serving. Absolutely delicious served with some oven-baked jacket potato wedges, a lovely green salad and some hot chilli sauce.
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == nil }
    its(:yield) { should == "4" }

  end

end


