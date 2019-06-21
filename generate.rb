require "erb"

@htmls = Dir.glob("boxes/*").map do |filename|
  File.read(filename)
end

puts ERB.new(File.read("index.html.erb")).result(binding)
