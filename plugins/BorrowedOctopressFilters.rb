module Jekyll
  module BorrowedOctopressFilters
    # Returns a url without the protocol (http://)
    # Borrowed from https://github.com/imathis/octopress/blob/d684a65/plugins/octopress_filters.rb
    def shorthand_url(input)
      input.gsub(/(https?:\/\/)(\S+)/) do
        $2
      end
    end

    # Replaces relative urls with full urls
    # Borrowed from b0b9c0a
    def expand_urls(input, url='')
      url ||= '/'
      input.gsub(/(\s+(href|src)\s*=\s*["|']{1})(\/[^\/>]{1}[^\"'>]*)/) do
        $1+url+$3
      end
    end

    Liquid::Template.register_filter(self)
  end
end
