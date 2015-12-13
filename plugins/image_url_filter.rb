module Jekyll
  module ImageUrlFilter
    def image_url(input)
      baseurl = @context.registers[:site].baseurl
      "#{baseurl}/images/#{input}"
    end

    Liquid::Template.register_filter(self)
  end
end
