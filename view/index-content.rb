require 'helper/arxta-page'


class IndexPage < ArxtaPage
  def content
    for_page_content do
      p 'here is some content'
      p 'here is some more content'
      p 'here is even more content'
    end
  end
end

