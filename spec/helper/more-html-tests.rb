require 'test/unit'
require 'shoulda'
require 'erector'
require 'assert2'
require 'assert2/xpath'


require 'helper/more-html'

class ComposedTagTests < Test::Unit::TestCase
  include Erector::Mixin

  # Seems silly to test all of these.

  def create(&block)
    text = erector(&block)
    assert_xhtml(text)
  end

  context "lip" do
    should "compose two tags" do
      create { lip("foo") }
      assert { xpath('/li/p').text == 'foo' }
    end

    should "allow block" do
      create { lip { em "foo" } }
      assert { xpath('/li/p/em').text == 'foo' }
    end
  end
end

