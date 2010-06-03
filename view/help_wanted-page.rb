require 'helper/arxta-page'

module View

class HelpWantedPage < ArxtaPage


  def content
    for_page_content do
      p do
        rawtext %Q{While AR&otimes;TA began as a "}
        a "ha ha only serious", :href => "http://catb.org/jargon/html/H/ha-ha-only-serious.html"
        rawtext %Q{" quasi-joke, it resonates with enough people that it could become
                 a nontrivial force for good. If you're interested in working toward
                 that, join the }
        a "mailing list", :href => "http://groups.google.com/group/arxta-work"

        rawtext "."
      end

      p do
        rawtext "We could use someone with graphic design skill to make the website
                 look better. The site is powered by "
        a 'Sinatra', :href => "http://www.sinatrarb.com/"
       rawtext ", an interesting Ruby web framework, and we could use more people
                to add to it."
      end

    end
  end
end

end
