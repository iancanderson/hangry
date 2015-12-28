require 'hangry'
require 'rspec/its'

describe Hangry do

  describe "schema.org" do

    let(:html) do
      <<-eos
      <!DOCTYPE html>
      <html>
      <body>
      <div itemscope itemtype="http://schema.org/Recipe">
        <span itemprop="name">Mom's World Famous Banana Bread</span>
        By <span itemprop="author">John Smith</span>,
        <meta itemprop="datePublished" content="2009-05-08">May 8, 2009
        <img itemprop="image" src="bananabread.jpg" />

        <span itemprop="description">This classic banana bread recipe comes from my mom -- the walnuts add a nice texture and flavor to the banana bread.</span>

        Prep Time: <meta itemprop="prepTime" content="PT15M">15 minutes
        Cook time: <meta itemprop="cookTime" content="PT1H">1 hour
        Yield: <span itemprop="recipeYield">1 loaf</span>

        <div itemprop="nutrition"
          itemscope itemtype="http://schema.org/NutritionInformation">
          Nutrition facts:
          <span itemprop="calories">240 calories</span>,
          <span itemprop="fatContent">9 grams fat</span>
        </div>

        Ingredients:
        - <span itemprop="ingredients">3 or 4 ripe bananas, smashed</span>
        - <span itemprop="ingredients">1 egg</span>
        - <span itemprop="ingredients">3/4 cup of sugar</span>
        ...

        Instructions:
        <span itemprop="recipeInstructions">Preheat the oven to 350 degrees. Mix in the ingredients in a bowl. Add the flour last. Pour the mixture into a loaf pan and bake for one hour.</span>

        140 comments:
        <meta itemprop="interactionCount" content="UserComments:140" />
        From Janel, May 5 -- thank you, great recipe!
        ...
      </div>
      </body>
      </html>
      eos
    end

    subject { Hangry.parse(html) }

    its(:author) { should == "John Smith" }
    its(:cook_time) { should == 60 }
    its(:description) { should == 'This classic banana bread recipe comes from my mom -- the walnuts add a nice texture and flavor to the banana bread.' }
    its(:image_url) { should == "bananabread.jpg" }
    its(:ingredients) { should == ["3 or 4 ripe bananas, smashed", "1 egg", "3/4 cup of sugar"] }
    its(:instructions) { should == "Preheat the oven to 350 degrees. Mix in the ingredients in a bowl. Add the flour last. Pour the mixture into a loaf pan and bake for one hour." }
        
    its(:name) { should == "Mom's World Famous Banana Bread" }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == Date.parse("2009-05-08") }
    its(:yield) { should == '1 loaf' }

    context "with no input" do
      subject { Hangry.parse("") }

      it "should set all attributes to nil" do
        Hangry::RECIPE_ATTRIBUTES.each do |attribute|
          expect(subject.send(attribute)).to be_nil
        end
      end

    end

    context "time duration parsing" do

      let(:html) do
        <<-eos
        <!DOCTYPE html>
        <html>
        <body>
        <div itemscope itemtype="http://schema.org/Recipe">
          Prep Time: <meta itemprop="prepTime" content="PT1H15M">1 hour, 15 minutes
          Cook time: <meta itemprop="cookTime" content="PT1H">1 hour
        </div>
        </body>
        </html>
        eos
      end

      it "should convert times to total minutes" do
        expect(subject.prep_time).to eq(75)
        expect(subject.cook_time).to eq(60)
      end

    end

  end

end

