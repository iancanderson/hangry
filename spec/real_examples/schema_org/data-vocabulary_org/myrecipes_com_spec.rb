# encoding: utf-8
require 'hangry'
require 'rspec/its'

describe Hangry do

  context "myrecipes.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/data-vocabulary_org/myrecipes.com.html") }
    subject { Hangry.parse(html) }

    it "should use the correct parser" do
      expect(Hangry::ParserClassSelecter.new(html).parser_class).to eq(Hangry::DataVocabularyRecipeParser)
    end
    
    its(:author) { should == "Southern Living" }
    its(:canonical_url) { should == 'http://www.myrecipes.com/recipe/best-carrot-cake-10000000257583/' }
    its(:cook_time) { should == nil }
    its(:description) { should == "" } # not valid HTML to have a p inside of an h2...
    its(:image_url) { should == "http://img4-2.myrecipes.timeinc.net/i/recipes/sl/03142008/carrot-cake-sl-257583-l.jpg" }
    its(:ingredients) {
      should == [
        "2 cups all-purpose flour", "2 teaspoons baking soda", "1/2 teaspoon salt", "2 teaspoons ground cinnamon",
        "3 large eggs", "2 cups sugar", "3/4 cup vegetable oil", "3/4 cup buttermilk", "2 teaspoons vanilla extract",
        "2 cups grated carrot", "1 (8-ounce) can crushed pineapple, drained", "1 (3 1/2-ounce) can flaked coconut",
        "1 cup chopped pecans or walnuts", "Buttermilk Glaze", "Cream Cheese Frosting"
      ]
    }
    its(:instructions) do
      instructions = <<-eos
      Line 3 (9-inch) round cakepans with wax paper; lightly grease and flour wax paper. Set pans aside.
Stir together first 4 ingredients.
Beat eggs and next 4 ingredients at medium speed with an electric mixer until smooth. Add flour mixture, beating at low speed until blended. Fold in carrot and next 3 ingredients. Pour batter into prepared cakepans.
Bake at 350° for 25 to 30 minutes or until a wooden pick inserted in center comes out clean. Drizzle Buttermilk Glaze evenly over layers; cool in pans on wire racks 15 minutes. Remove from pans, and cool completely on wire racks. Spread Cream Cheese Frosting between layers and on top and sides of cake.
      eos
      should == instructions.strip
    end
    it "should have nil nutrition attributes" do
      subject.nutrition.each do |attribute, value|
        expect(value).to be_nil
      end
    end
    its(:name) { should == "Best Carrot Cake" }
    its(:prep_time) { should == nil }
    its(:published_date) { should == Date.parse("OCTOBER 1997") }
    its(:total_time) { should == nil }
    its(:yield) { should == "1 (9-inch) cake" }

  end

end




