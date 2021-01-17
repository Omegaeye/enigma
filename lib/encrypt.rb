require './lib/key'
require './lib/offsets'
require './lib/enigma'

enigma = Enigma.new

argv = ARGV

file = File.open("lib/#{argv[0]}", "r").read.chomp

message = enigma.encrypt(file)

encrypted = File.open("lib/#{argv[1]}", "w").write(message[:encryption])

puts "Created #{argv[1]} with the key #{message[:key]} and date #{message[:date]}"
