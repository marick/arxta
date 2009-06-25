require 'helper/arxta-page'


class IndexPage < ArxtaPage
  def the_footer
    footer do
      p do
        text "The image of futuristic Seattle was composed of photos from "
        a 'Jake Khuon', :href=>"http://www.flickr.com/photos/wintrhawk/470424868/"
        text ", "
        a 'Steve Jurvetson', :href=> "http://www.flickr.com/photos/jurvetson/2904881415/"
        text ', and '
        a 'FaceMePLS', :href=>"http://www.flickr.com/photos/faceme/1509037350/"
        text ". All the images are covered by a Creative Commons license. "
        text "The look and feel of the site is loosely based on the Urban template delivered with "
        a 'RapidWeaver', :href=>"http://www.realmacsoftware.com/rapidweaver/"
        text '.'
      end
    end
  end
  
  def content
    for_page_content do
      p do
        rawtext "We believe "
        a "Agile software development", :href=>"http://www.agilemanifesto.org"
        rawtext " is being dumbed down, commodified,
        and is losing its spirit. We seek to replace the current
        name with one having two virtues: first, that it capture
        more exactly the attitudes originally behind Agile; second,
        that it be obscure enough that no one will assume they
        already know what it means and that&mdash;amazingly
        enough!&mdash;they are already doing it."
      end

      p do
        rawtext 'There are two halves to the story: an attitude toward '
        b 'technology'
        rawtext ' and an attitude toward '
        b 'the social'
        rawtext ". To form the Agile attitude, those two attitudes are crossed
                  (hybridized) like lions or tigers are crossed to form "
        a 'ligers',  :href=>"http://en.wikipedia.org/wiki/Liger"
        rawtext '. Or perhaps a better analogy would be '
        a 'crosses between chicken and game birds',  :href=>"http://en.wikipedia.org/wiki/Chicken_hybrids#Chicken_Hybrids"
        rawtext ", since those species are less closely related than lions and tigers&mdash;just
                 as technology and the social are often ("
        a 'wrongly', :href=>"http://www.exampler.com/blog/2007/11/06/latour-table-of-contents/"
        rawtext ') considered wildly different things.'
      end

      h2 'Technology'

      p do
        rawtext "Within "
        em "technology"
        rawtext ", "
        a 'artisanal', :href=>"http://dictionary.reference.com/browse/artisanal"
        rawtext ' is supposed to connote:'
      end

      ul do
        lip "Higher quality and a focus on a more demanding customer."
        lip do
          rawtext 'A product that&#8217;s an unusual variation on a more typical product,
                   typically one that&#8217;s not suitable for mass production. (For example, an '
          a 'artisanal apple', :href=>"http://www.wpr.org/book/071125b.html"
          rawtext ' might not ship as well as common varieties.) In the context of software development,
                    &#8220;artisanal&#8221; therefore suggests an extreme focus on the '
          a 'product director', :href=>"http://www.exampler.com/old-blog/2006/04/21/#how-to-be-a-product-diretor"
          rawtext'.'
        end
        li do
          p do
            rawtext 'A '
            a 'craftsmanlike', :href=>"http://manifesto.softwarecraftsmanship.org/"
            rawtext 'approach to process. That process is sometimes, '
            em 'but not exclusively'
            rawtext ', &#8220;old fashioned&#8221; or manual. We are like this '
            a 'artisanal cheese maker', :href=>"http://njmonthly.com/articles/lifestyle/health_and_wellness/artisanal-foods.html"
            rawtext ':'
          end
          blockquote do
            p raw("	  But [Wajswol] gladly lets technology lend a hand. Twice a day, in the &#8220;milking parlor,&#8221;
                  a computerized lactation carousel that handles 60 sheep at once&mdash;the only one in the
                  U.S. for sheep, Wajswol claims&mdash;milks 300 ewes per hour. In the cheese room, vats of milk
                  are heated to the precise temperatures required to activate specific strains of bacteria to produce
                  just the right texture of curd.")
            p raw("&#8220;Machinery helps you pay attention to what's important,&#8221; Wajswol says.
                   &#8220;In cheese making, there are a couple of things you need to focus on. If you can eliminate
                   the nonsense&mdash;the mundane, nonskilled steps, like feeding the animals or warming milk
                   correctly&mdash;you can spend more time focusing on the texture of the curd and making sure
                   the product comes out good.&#8221;")
          end

        end
      end
      p "But artisanal is too broad of a term. It needs to qualify something else. What?"

      p do
        rawtext "At a workshop once, "
        a "Pete McBreen", :href=>"http://www.mcbreen.ab.ca/"
        rawtext " said
            &#8220;The Agile methods are methods created by people who
            like to program.&#8221; While that&#8217;s not entirely
            true, we bet it&#8217;s more true of that particular bunch
            of people than of any
            previous gaggle of methodologists. And their oddity went
            even further: a surprising number of the authors of the "

        a 'Agile Manifesto', :href=>"http://agilemanifesto.org/"
        rawtext " had programmed in "
        a 'Smalltalk', :href=>"http://www.smalltalk.org/main/"
        rawtext ". They
            were technology enthusiasts, and that enthusiasm&mdash;a
            &#8220;gosh wow!&#8221; enthusiasm for continuous
            integration tools, refactoring tools, programming languages,
            testing tools, and the like&mdash;has been a continuous part
            of the growth of Agile. It&#8217;s been a touch
            disreputable, though&mdash;because of the Agile
            Manifesto&#8217;s &#8220;individuals and interactions over
            processes and tools&#8221;&mdash;so we've chosen
            the artistic style called "
        strong { a 'retro-futurism', :href=>"http://en.wikipedia.org/wiki/Retro-futurism" }
        rawtext " to call renewed attention to it."
      end


      p "We are using retro-futurism in one of its senses:"
      blockquote do
        p do
          rawtext "[a] vision of the future as seen through the eyes of the past, often a utopian society
           characterized by high technology (relative to the base time), unusual or exaggerated artistic,
           architectural and fashion styles, and an abundance of consumer goods; its spirit of optimism
           [&#8230;] is a contrast with "
          a 'cyberpunk', :href=>"http://www.cyberpunkreview.com/what-is-cyberpunk/"
          rawtext "[&#8230;]"
        end
        p do
          rawtext "(Quote from "
          a 'ibid', :href=>"http://en.wikipedia.org/wiki/Retro-futurism"
          rawtext ".)"
        end
      end

      p do
        rawtext "Another way of looking at the style is as a response to
                 the oft-heard complaint, &#8220;It&#8217;s the future
                 now. Where&#8217;s my flying car?&#8221; The physical world
                  is disappointingly short on flying cars, rocket packs, and
                all the rest. In the software world, though, we have
                flying cars: tools&mdash;and team-scale processes&mdash;that still evoke that
                old excitement and "
        a "sense of wonder", :href=>"http://en.wikipedia.org/wiki/Sense_of_wonder"
        rawtext "."
      end

      pem do
        rawtext "So. The "
        b "technology"
        rawtext "half of the cross casts attention on giddy enthusiasm for both our products and how
                 we build them."
      end

      h2 "The Social"

      p do
       rawtext "Agile&#8217;s early emphasis on self-organizing teams caused some to brand it "
       strong "anarchic"
       rawtext ". Soothing those fears has led, in too many cases, to team processes that are externally
                imposed and therefore ossified. To counter that trend, we want to embrace the anarchic
                strain in Agile. (What should be done to sooth fears, we believe, is nothing more than
                producing working software at frequent intervals. So long as a team delivers that which
                satisfies, no one should care if an integral part of their process is capering naked in the
                light of the full moon.)"
      end

      p do

        rawtext "At the same time, we want to recenter emphasis on the "
        strong "team"
        rawtext ". Too much of modern-day Agile depends on "
        em "someone else"
        rawtext "to make it succeed. Typically that&#8217;s upper management, whether via "
        a 'servant leadership', :href=>"http://www.leadersdirect.com/servant.html"
        rawtext ", outright command-and-control management, or something in between. While we
                can&#8217;t ignore the world outside the team, we think it better to take the
                attitude that, while it can make Agile fail, it cannot make it "
        em "succeed"
        rawtext ". Agile lives and dies by the team."
      end

      p do

        rawtext "Casting about for something odd that would combine
                  &#8220;anarchy&#8221; and &#8220;team&#8221;, we came upon"
        strong "anarcho-syndicalism"
        rawtext ". "
        a 'Anarcho-syndicalism', :href=>"http://en.wikipedia.org/wiki/Anarcho-syndicalism"
        rawtext "was an economic/political movement from around 100 years
                ago. The anarcho-syndicalists had laborers as their
                constituency. Their goal was to end the oppressive
                power&mdash;and very existence&mdash;of both the State and
                large-scale corporations by countering them with
                self-organizing trades unions. Anarcho-syndicalism&#8217;s
                concentration on the self-organization and solidarity of the
                people whose hands and minds make the product is reminiscent of Agile at its best."
      end

      p do
        rawtext "We are also taken by anarcho-syndicalism&#8217;s emphasis on "
        em 'direct action'
        rawtext ". Others believed that the route to
              better working conditions lay in, say, electing
              representatives who would speak for the workers, but the
              anarcho-syndicalists rejected that. In that rejection, we
              hear echoes of the attitude that teams should not wait for"
        strike 'daddy'
        rawtext "management to fix their problems."
      end

      p do
        rawtext "Having chosen an outlandish reference&mdash;anarcho-syndicalism? a type of omigod "
        em 'socialism'
        rawtext "&mdash;we add a softening
                qualifier. Ending the State, fighting the Corporation, doing
                away with wage slavery&mdash;none of these are part of our
                programme. We&#8217;re just trying to develop good software
                in a pleasant way that makes sense. Therefore: the qualifier "
        strong 'team-scale'
        rawtext 'is intended to remind that our message is to the workers of a team, not the '
        a 'workers of the world', :href=>"http://www.brainyquote.com/quotes/quotes/k/karlmarx109309.html"
        rawtext '.'
      end

      pem do
        rawtext "So. The "
        strong 'social'
        rawtext "half of the cross casts attention on perfecting the team. Or, rather, on the team perfecting itself."
      end

      h2 'Summary'

      p "To the extent that Agile has lost its way, a slogan that reminds us of the original path
         will help. To the extent that Agile as a movement now favors bland conformity over
         scrappiness and outrageous ideas, an outrageous slogan can help us get back to where we
         once belonged."
    end
  end
end

