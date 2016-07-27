require 'templateur/renderer'

module Templateur
  class CLI
    def initialize
      @renderer = Renderer.new
    end

    def run(*args)
      format = args.shift[2..-1]
      template = load_file(args.shift)
      parameters = YAML.load(load_file(args.shift))
      rendered = @renderer.render(template, parameters)

      case format
        when 'json'
          puts JSON.pretty_generate(rendered)
        when 'yaml'
          puts YAML.dump(rendered)
      end
    end

    private

    def load_file(path)
      f = File.open(path)
      data = f.read
      f.close

      data
    end
  end
end
