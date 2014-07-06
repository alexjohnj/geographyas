# By Alex Jackson
# MIT License

module Jekyll
  module Titlecase

    def titlecase(input)
      input.split(' ').map {|w| w.capitalize}.join(' ')
    end

  end
end

Liquid::Template.register_filter(Jekyll::Titlecase)