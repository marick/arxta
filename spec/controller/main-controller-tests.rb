require 'spec/testutil/requires'
require 'controller/main'

class MainControllerUtilTests < Test::Unit::TestCase
  should "make capitalized view class names from symbols" do
    assert { MainController.klassify(:hello) == "HelloPage" }
    puts MainController.klassify(:help_wanted)
    assert { MainController.klassify(:help_wanted) == "HelpWantedPage" }
  end

end
