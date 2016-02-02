module Jekyll
  module TumblrFileFilter
    def tumblr_file(input)
      "/tumblr_files/tumblr_#{input}"
    end

    Liquid::Template.register_filter(self)
  end
end
