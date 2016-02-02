module Jekyll
  module ImageUrlFilter
    def image_url(input)
      "/images/#{input}"
    end

    Liquid::Template.register_filter(self)
  end
end
