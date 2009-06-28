module ErectorTest

  class TestCase < Test::Unit::TestCase
    include Erector::Mixin

    def erectorify(&block)
      text = erector(&block)
      assert_xhtml(text)
    end

    def default_test; end
  end
end
