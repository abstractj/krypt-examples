require 'krypt'
require 'krypt/provider/openssl'

password = "strong"

ossl = Krypt::Provider::OpenSSL.new
Krypt::Provider.register(ossl)

digest = Krypt::Digest::SHA256.new
pbkdf2 = Krypt::PBKDF2.new(digest)

salt = OpenSSL::Random.random_bytes(16)
len = digest.digest_length
iter = 20000

hash = pbkdf2.generate_hex(password, salt, iter, len)
puts "#{hash}"