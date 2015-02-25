# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "eatingwell.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/eatingwell.com.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::Parsers::NonStandard::EatingWellParser)
    end

    its(:author) { should == "From EatingWell" }
    its(:canonical_url) { should == "http://www.eatingwell.com/recipes/sauteed_chicken_breasts_with_creamy_chive_sauce.html" }
    its(:cook_time) { should == nil }
    its(:description) { should == "Here's a sauce so delicious, it's missing only one thing: a little crunchy bread to dip in it. Make It a Meal: Serve with steamed asparagus or cauliflower, mashed potatoes or orzo pasta, and a glass of Vinho Verde." }
    its(:image_url) { should == "http://bed56888308e93972c04-0dfc23b7b97881dee012a129d9518bae.r34.cf1.rackcdn.com/sites/default/files/imagecache/standard/recipes/MP4834.JPG" }
    its(:ingredients) {
      should == [
        "4 boneless, skinless chicken breasts, (about 1 pound), trimmed of fat",
        "1 teaspoon kosher salt, divided",
        "1/4 cup plus 1 tablespoon all-purpose flour, divided",
        "3 teaspoons extra-virgin olive oil, divided",
        "2 large shallots, finely chopped",
        "1/2 cup dry white wine",
        "1 14-ounce can reduced-sodium chicken broth",
        "1/3 cup reduced-fat sour cream",
        "1 tablespoon Dijon mustard",
        "1/2 cup chopped chives, (about 1 bunch)"
      ]
    }
    its(:name) { should == "Sauteed Chicken Breasts with Creamy Chive Sauce" }
    its(:nutrition) do
      should == {
        calories: '244',
        cholesterol: '72 mg',
        fiber: '0 g',
        protein: '26 g',
        saturated_fat: '3 g',
        sodium: '679 mg',
        sugar: nil,
        total_carbohydrates: '1 g',
        total_fat: '9 g',
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end

    its(:instructions) {
      instructions = <<-EOS
Place chicken between sheets of plastic wrap and pound with a meat mallet or heavy skillet until flattened to an even thickness, about 1/2 inch. Season both sides of the chicken with 1/2 teaspoon salt. Place 1/4 cup flour in a shallow glass baking dish and dredge the chicken in it. Discard the excess flour.
Heat 2 teaspoons oil in a large nonstick skillet over medium-high heat. Add the chicken and cook until golden brown, 1 to 2 minutes per side. Transfer to a plate, cover and keep warm.
Heat the remaining 1 teaspoon oil in the pan over medium-high heat. Add shallots and cook, stirring constantly and scraping up any browned bits, until golden brown, 1 to 2 minutes. Sprinkle with the remaining 1 tablespoon flour; stir to coat. Add wine, broth and the remaining 1/2 teaspoon salt; bring to a boil, stirring often.
Return the chicken and any accumulated juices to the pan, reduce heat to a simmer, and cook until heated through and no longer pink in the center, about 6 minutes. Stir in sour cream and mustard until smooth; turn the chicken to coat with the sauce. Stir in chives and serve immediately.
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == 35 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 35 }
    its(:yield) { should == "4 servings" }

  end

end

