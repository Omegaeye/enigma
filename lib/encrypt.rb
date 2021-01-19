require './lib/key'
require './lib/offsets'
require './lib/enigma'

enigma = Enigma.new

argv = ARGV

file = File.open("lib/#{argv[0]}", "r").read.chomp

  if argv[2] == nil && argv[3] == nil
    message = enigma.encrypt(file)
  elsif argv[2] == nil
    message = enigma.encrypt(file, argv[3])
  elsif argv[3] == nil
    message = enigma.encrypt(file, argv[2])
  else
    message = enigma.encrypt(file, argv[2], argv[3])
  end



encrypted = File.open("lib/#{argv[1]}", "w").write(message[:encryption])

puts "Created #{argv[1]} with the key #{message[:key]} and date #{message[:date]}"
