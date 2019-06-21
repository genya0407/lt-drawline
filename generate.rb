require "erb"

Page = Struct.new(:title, :html)

@pages = Dir["boxes/*"].sort.map do |filename|
  page = Page.new
  page.title = filename.match(%r[boxes/\d+_(.+).html])[1]
  page.html = File.read(filename)
  page
end

puts ERB.new(File.read("index.html.erb")).result(binding)
