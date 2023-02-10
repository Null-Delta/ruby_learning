puts "Салям Алейкум, #{ARGV[0]}. Какой твой любимый яп?"

language = $stdin.gets.chomp

case language
when "ruby" then puts "подзила"
when "html" then puts "да вы базированный гигачад я погляжу"
when "swift" then puts "уважительно."
when "c#" then puts "боже..."
when "php" then puts "лучше бы был с#..."
else puts "скоро будет ruby)"
end