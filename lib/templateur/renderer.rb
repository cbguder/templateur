require 'yaml'
require 'json'

module Templateur
  class Renderer
    def render(template, parameters)
      yaml = template.gsub(/{{([-\w]+)}}/) do |match|
        parameters[$1].to_json || match
      end

      YAML.load(yaml)
    end
  end
end
