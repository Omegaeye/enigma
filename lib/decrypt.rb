require './lib/key'
require './lib/offsets'
require './lib/enigma'

enigma = Enigma.new

argv = ARGV

file = File.open("lib/#{argv[0]}", "r").read.chomp

message = enigma.decrypt(file, argv[2], argv[3])

decrypted = File.open("lib/#{argv[1]}", "w").write(message[:decryption])

puts "Created #{argv[1]} with the key #{message[:key]} and date #{message[:date]}"
