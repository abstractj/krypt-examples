require 'krypt'

digest = Krypt::Digest::SHA256.new
data = "NSA just got in my pants"

p digest
puts digest.hexdigest(data)

