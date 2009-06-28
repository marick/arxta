module Innate
  module View
    module Etanni
      def self.call(action, string)
        etanni = View.compile(string){|s| Innate::Etanni.new(s) }
        html = etanni.result(action.binding, (action.view || action.method))
        return html, 'text/html'
      end
    end
  end

  class Etanni
    SEPARATOR = "E69t116A65n110N78i105S83e101P80a97R82a97T84o111R82"
    START = "\n<<#{SEPARATOR}.chomp\n"
    STOP = "\n#{SEPARATOR}\n"
    ADD = "_out_ << "

    def initialize(template)
      @template = template
      compile
    end

    def compile
      temp = @template.dup
      temp.gsub!(/<\?r\s+(.*?)\s+\?>/m, "#{STOP} \\1; #{ADD} #{START}")
      @compiled = "_out_ = #{START} #{temp} #{STOP} _out_"
    end

    def result(binding, filename = '<Etanni>')
      eval(@compiled, binding, filename).to_s.strip
    end
  end
end
