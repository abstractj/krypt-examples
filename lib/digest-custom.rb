require 'krypt'
require 'rbnacl-provider'

data = "NSA just got in my pants"

rbnacl = Example::Provider::RbNaCl.new

Krypt::Provider.register(rbnacl)
sha = Example::Digest::SHA256.new

puts "SHA-256: #{sha.hexdigest(data)}"     

