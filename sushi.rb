SUSHI_MAP = {
  # filename: aliases
  '01' => ["yes"],
  '02' => ["no"],
  '03' => ["ok"],
  '04' => ["thanks", "thank you", "gyoku"],
  '05' => ["sorry"],
  '06' => ["sigh"],
  '07' => ["angry"],
  '08' => ["no comment"],
  '09' => ["cool"],
  '10' => ["kappa"],
  '11' => ["help"],
  '12' => ["what", "question", "?"],
  '13' => ["sleep", "sleepy"],
  '14' => ["oh no"],
  '15' => ["love"],
  '16' => ["grin"],
  '17' => ["bye"],
  '18' => ["sneak"],
  '19' => ["hide"],
  '20' => ["peel"],
  '21' => ["hot"],
  '22' => ["fail", "dip"],
  '23' => ["too much", "ikura"],
  '24' => ["happy"],
  '25' => ["smile"],
  '26' => ["wat", "anago"],
  '27' => ["tea", "content", "agari"],
  '28' => ["gari", "don't forget"],
  '29' => ["wasabi", "sabi"],
  '30' => ["come on", "c'mon"],
  '31' => ["sparkles"],
  '32' => ["sweat"],
  '33' => ["cry"],
  '34' => ["surprised"],
  '35' => ["idea"],
  '36' => ["sad", "sob"],
  '37' => ["chat"],
  '38' => ["phone", "call"],
  '39' => ["hello"],
  '40' => ["see you"],
}

def item_xml(options = {})
  <<-ITEM
  <item arg="#{options[:arg]}" uid="#{options[:uid]}">
    <title>#{options[:title]}</title>
    <subtitle>#{options[:subtitle]}</subtitle>
    <icon>#{options[:path]}</icon>
  </item>
  ITEM
end

items = SUSHI_MAP.map { |filename, keywords|
  next if ARGV.first && !keywords.any?{ |keyword| keyword.match(/^#{ARGV.first}/) }
  sushi_name = keywords[0]
  path       = "sushiyuki_images/#{filename}.png"
  item_xml(arg: filename, uid: filename, path: path, title: keywords.join(', '),
           subtitle: "Enter to copy url to clipboard. (Cmd + Enter to copy as markdown.)" )
}.compact.join

puts "<?xml version='1.0'?><items>#{items}</items>"
