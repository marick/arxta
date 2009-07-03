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

  def assert_routes(*expected_routes)
    expected_routes.each_with_index do | route, index |
      assert_route(index, route)
    end
  end

  def setup
    @link_maker = RecordingFakeWidget.new
  end

  should "ask link-maker widget to create intra-site links" do
    page = ArxtaPage.new(:within_site_link_maker => @link_maker)
    page.pretty
    assert_routes(:index,
                  :explanation,
                  :video,
                  :gear)         
  end

end
