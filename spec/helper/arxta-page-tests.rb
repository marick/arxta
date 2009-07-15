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
                  :gear,
                  :help_wanted)
  end

  context "display of links relevant to current page" do

    should "be empty when there are no relevant links" do
      page = ArxtaPage.new(:within_site_link_maker => @link_maker)
      assert_xhtml(page.to_pretty)
      deny { xpath(:div, :links_relevant_to_this_page)}
    end

    should "display a link when given" do
      page = ArxtaPage.new(:within_site_link_maker => @link_maker)
      page.has_relevant_link("name", :href => "http://www.example.com")
      assert_xhtml(page.to_pretty)
      assert do
        xpath(:div, :links_relevant_to_this_page) do
          xpath(:a, :href => "http://www.example.com").text == "name"
        end
      end
    end

    should "be able to display two links too" do
      page = ArxtaPage.new(:within_site_link_maker => @link_maker)
      page.has_relevant_link("name1", :href => "http://www.example1.com")
      page.has_relevant_link("marick", :href => "http://www.exampler.com")
      assert_xhtml(page.to_pretty)
      assert do
        xpath(:div, :links_relevant_to_this_page) do
          xpath(:a, :href => "http://www.example1.com", ?. => "name1")
          xpath(:a, :href => "http://www.exampler.com", ?. => "marick")
        end
      end
    end
  end
end
