# encoding: UTF-8
require 'hangry'

describe Hangry do

  context "chow.com recipe" do
    let(:html) { File.read("spec/fixtures/schema_org/data-vocabulary_org/chow.com.html") }
    subject { Hangry.parse(html) }

    its(:author) { should == "Amy Wisniewski" }
    its(:canonical_url) { should == "http://www.chow.com/recipes/30700-strawberry-rhubarb-pie-with-sour-cream-crust" }
    its(:cook_time) { should == nil }
    its(:description) { should == "In this pie, sweet strawberries and tart rhubarb make a harmonious sweet-tart filling. The crust has a bit of richness from sour cream, and though rolling out pie dough can be a challenge, you can manhandle this dough a little without fear of toughening it up. Once the pie is finished baking, be sure to wait until it’s totally cooled to let the filling set, then enjoy with a scoop of ice cream. Special equipment: A 1-inch round cutter is needed to cut out the vents in the top crust of the pie. You’ll also need an instant-read thermometer and a pastry brush for this recipe." }
    its(:image_url) { should == "http://search.chow.com/thumbnail/1600/0/www.chowstatic.com/assets/recipe_photos/30700_strawberry_rhubarb_pie2.jpg" }
    its(:ingredients) {
      should == [
        "2 1/2 cups all-purpose flour",
        "2 tablespoons granulated sugar",
        "1/2 teaspoon fine salt",
        "1/2 cup shortening, frozen and cut into small pieces",
        "10 tablespoons cold unsalted butter (1 1/4 sticks), cut into small pieces",
        "1/2 cup plus 2 tablespoons sour cream",
        "All-purpose flour, for dusting the work surface",
        "1 1/4 cups granulated sugar",
        "1/2 cup cornstarch",
        "2 pounds rhubarb, ends trimmed and cut into 1/2-inch pieces (about 7 cups)",
        "1 pound strawberries, washed, hulled, and cut into 1/2-inch pieces (about 3 cups)",
        "2 teaspoons freshly squeezed lemon juice",
        "1 large egg white, beaten"
      ]
    }
    its(:name) { should == "Strawberry-Rhubarb Pie with Sour Cream Crust" }
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
For the crust:\t1In a large bowl, whisk together the flour, sugar, and salt. Toss the shortening and butter in the flour mixture until well coated. Using a pastry blender or 2 knives, cut the shortening and butter into the dry ingredients until reduced to pea-size pieces, about 3 to 4 minutes.\t2Add the sour cream and mix just until the dough comes together, being careful not to work the dough too much.\t3Divide the dough into 2 flat disks, one slightly larger than the other. Wrap tightly in plastic wrap and refrigerate for at least 1 hour.
For the pie:\t1Remove the dough from the refrigerator and set it aside at room temperature for 30 minutes.\t2On a lightly floured surface, roll out the slightly larger disk to about 12 inches in diameter and 1/4 inch thick. (If the dough is very crumbly, gather it into a ball and knead it a few times to make it more pliable, then roll it out.) Line a 9-inch pie plate with the dough and trim it to leave a 1-inch overhang. Set aside.\t3Place 1 teaspoon of the sugar in a small bowl and set it aside. Place the remaining sugar and cornstarch in a large bowl and whisk to combine. Sprinkle 2 tablespoons of the sugar-cornstarch mixture evenly over the bottom of the pie crust.\t4Add the rhubarb, strawberries, and lemon juice to the bowl with the remaining sugar-cornstarch mixture and stir to evenly coat the fruit. Set aside.\t5Roll out the remaining dough disk on a lightly floured surface to about 11 inches in diameter and 1/4 inch thick. Using a 1-inch round cutter, stamp out circles, leaving at least a 3-inch border from the edge and 1 1/2 inches of space between each circle (you should have about 12 cutouts). Set the cutout circles aside.\t6Stir the rhubarb-strawberry mixture to redistribute the juices. Pour it into the prepared crust, mounding it in the center, and gently pat it down. Brush the dough overhang with the egg white. Place the top crust over the fruit and trim the excess dough to a 1-inch overhang. Fold the edge of the bottom crust over the top crust and press to seal. If desired, crimp the edge, using the forefinger of one hand to push the dough between the forefinger and thumb of the other hand. \t7Brush the top of the pie with some of the remaining egg white. Arrange the cutout circles intermittently over the top crust (not covering the holes), and brush the cutout circles with egg white, discarding any left over. Evenly sprinkle the reserved sugar over the top of the pie. Place the pie in the freezer while the oven heats.\t8Heat the oven to 425°F and arrange a rack on the bottom. Place a baking sheet lined with a double layer of aluminum foil on the rack.\t9Place the pie on the hot baking sheet and bake for 30 minutes. Lower the temperature to 350°F and bake until the crust is brown and the fruit is bubbling, about 1 hour 40 minutes more. (The center of the filling should read 212°F on an instant-read thermometer for it to set properly.) If the crust around the edges of the pie starts to brown before the pie is done, cover the edges with aluminum foil.\t10Remove the pie from the oven and let it sit on the baking sheet until the fruit stops bubbling, about 5 minutes. Transfer to a wire rack to cool completely and let the filling set before slicing, at least 3 hours.
      EOS
      should == instructions.strip
    }

    its(:prep_time) { should == nil }
    its(:published_date) { should == nil }
    its(:total_time) { should == 420 }
    its(:yield) { should == "1 (9-inch) pie, or 8 to 10 servings" }

  end

end


