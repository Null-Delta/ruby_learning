puts "Введите команду ruby:"

ruby_command = $stdin.gets.chomp

puts "Введите системную команду:"

system_command = $stdin.gets.chomp

eval(ruby_command)

puts `#{system_command}`