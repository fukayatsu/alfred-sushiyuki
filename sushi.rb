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
  '41' => ["smile_salmon"],
  '42' => ["yeah"],
  '43' => ["ok_dish"],
  '44' => ["no_dish"],
  '45' => ["gorgeous"],
  '46' => ["good"],
  '47' => ["hopping"],
  '48' => ["i_see"],
  '49' => ["kappamaki"],
  '50' => ["hi_kappamaki"],
  '51' => ["seeyou_kappamaki"],
  '52' => ["bath", "miso_soup"],
  '53' => ["mustache"],
  '54' => ["omg"],
  '55' => ["upset"],
  '56' => ["confused"],
  '57' => ["sigh_maguro"],
  '58' => ["fall"],
  '59' => ["shocked"],
  '60' => ["frozen"],
  '61' => ["what_temaki"],
  '62' => ["dancing_temaki"],
  '63' => ["thanks_temaki"],
  '64' => ["congrats"],
  '65' => ["smiling"],
  '66' => ["supress"],
  '67' => ["lol"],
  '68' => ["gone"],
  '69' => ["angry_ikura", "bomb"],
  '70' => ["spread_ikura"],
  '71' => ["hot"],
  '72' => ["cold"],
  '73' => ["heart"],
  '74' => ["love_love"],
  '75' => ["lonely"],
  '76' => ["faint"],
  '77' => ["XD", "xd"],
  '78' => ["nap", "zzz"],
  '79' => ["good_night"],
  '80' => ["good_morning"],
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
