module Jekyll
  module ImageUrlFilter
    def image_url(input)
      "/images/#{input}"
    end

    def image_url_absolute(input)
      site = @context.registers[:site]
      "#{site.config['url']}#{image_url(input)}"
    end

    Liquid::Template.register_filter(self)
  end
end
