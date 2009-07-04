require 'spec/testutil/requires'
require 'helper/widgets'

class WidgetExtensionTests < ErectorTest::TestCase

  should "define emit_via to allow target-setting in call" do
    w = Erector::Widget.new { p @text }
    use_in_widget_context { w.emit_via(self, :text => 'a value')}
    assert { xpath(:p).text == 'a value'}
  end

end

class WithinSiteLinkMakerTests < ErectorTest::TestCase
  should "take a current_route as an argument" do
    assert_raise(RuntimeError) {
      WithinSiteLinkMaker.new
    }
  end

  should "ordinarily produces <a> with href of route" do
    maker = WithinSiteLinkMaker.new(:current_route => :somewhere)
    use_in_widget_context { maker.emit_via(self,
                                           :text => "some text",
                                           :route => :a_route )}
    assert do
      xpath :a, :href => 'a_route', ?. => 'some text'
    end

    deny { xpath :a, :id => 'current'}
  end

  should "NOT call route to another page 'current'" do
    maker = WithinSiteLinkMaker.new(:current_route => :somewhere)
    use_in_widget_context { maker.emit_via(self,
                                           :text => "irrelevant",
                                           :route => :a_route )}
    deny { xpath :a, :id => 'current'}
  end

  should "produce an id=current route when current_route is target page" do
    maker = WithinSiteLinkMaker.new(:current_route => :somewhere)
    use_in_widget_context { maker.emit_via(self,
                                           :text => 'dawn',
                                           :route => :somewhere) }

    assert do
      xpath :a, :id=>'current', :href => 'somewhere', ?. => 'dawn'
    end
  end

  should "allow strings or symbols as route" do
    maker = WithinSiteLinkMaker.new(:current_route => 'somewhere')
    use_in_widget_context { maker.emit_via(self,
                                           :text => 'dawn',
                                           :route => :somewhere) }

    assert do
      xpath :a, :id=>'current', :href => 'somewhere', ?. => 'dawn'
    end
  end

end
