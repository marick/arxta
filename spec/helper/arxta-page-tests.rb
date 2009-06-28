require 'spec/testutil/requires'
require 'helper/arxta-page'


class RecordingFakeWidget

  def [](index)
    @record[index]
  end
  
  def emit_via(parent, settings = {})
    @record ||= []
    @record << settings
  end
end


class ArxtaPageTests < ErectorTest::TestCase
  def assert_route(order, expected_route)
    assert { @link_maker[order][:route].to_s == expected_route.to_s }
  end

  def setup
    @link_maker = RecordingFakeWidget.new
  end

  should "ask link-maker widget to create intra-site links" do
    page = ArxtaPage.new(:within_site_link_maker => @link_maker)
    page.pretty
    assert_route(0, :index)
    assert_route(1, :gear)
  end

end
