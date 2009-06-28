module ErectorTest

  class TestCase < Test::Unit::TestCase
    include Erector::Mixin

    def use_in_widget_context(&block)
      text = erector(&block)
      assert_xhtml(text)
    end

    def default_test; end
  end
end
