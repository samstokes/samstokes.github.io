module Jekyll
  module ShorthandUrlFilter
    # Returns a url without the protocol (http://)
    # Borrowed from https://github.com/imathis/octopress/blob/d684a65/plugins/octopress_filters.rb
    def shorthand_url(input)
      input.gsub(/(https?:\/\/)(\S+)/) do
        $2
      end
    end

    Liquid::Template.register_filter(self)
  end
end
