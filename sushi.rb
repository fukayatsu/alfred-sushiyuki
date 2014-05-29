def item_xml(options = {})
  <<-ITEM
  <item arg="#{options[:arg]}" uid="#{options[:uid]}">
    <title>#{options[:title]}</title>
    <subtitle>#{options[:subtitle]}</subtitle>
    <icon>#{options[:path]}</icon>
  </item>
  ITEM
end

items = Dir.glob("sushiyuki_images/*.png").map { |file|
  sushi_name = File.basename(file, ".png")
  next if ARGV.first && !sushi_name.match(/#{ARGV.first}/)
  item_xml( arg: sushi_name, uid: sushi_name, path: file, title: sushi_name,
            subtitle: "Copy url to clipboard" )
}.compact.join

puts "<?xml version='1.0'?><items>#{items}</items>"