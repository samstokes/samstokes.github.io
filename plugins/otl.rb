require 'open3'

module Jekyll
  class OtlConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /otl/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      output = nil
      Open3.popen2('OTL html') do |stdin, stdout, process|
        stdin.write(content)
        stdin.close
        output = stdout.read
      end
      output
    end
  end
end
