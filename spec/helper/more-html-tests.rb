require 'spec/testutil/requires'

require 'helper/more-html'

class ComposedTagTests < ErectorTest::TestCase

  # Seems silly to test all of the composed tags.

  context "lip" do
    should "compose two tags" do
      use_in_widget_context { lip("foo") }
      assert { xpath('/li/p').text == 'foo' }
    end

    should "allow block" do
      use_in_widget_context { lip { em "foo" } }
      assert { xpath('/li/p/em').text == 'foo' }
    end
  end
end

