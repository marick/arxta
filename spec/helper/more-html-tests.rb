require 'spec/testutil/requires'

require 'helper/more-html'

class ComposedTagTests < ErectorTest::TestCase

  # Seems silly to test all of the composed tags.

  context "lip" do
    should "compose two tags" do
      erectorify { lip("foo") }
      assert { xpath('/li/p').text == 'foo' }
    end

    should "allow block" do
      erectorify { lip { em "foo" } }
      assert { xpath('/li/p/em').text == 'foo' }
    end
  end
end

