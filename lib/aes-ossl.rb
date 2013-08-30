require 'openssl'

data = "NSA just got in my pants"

cipher = OpenSSL::Cipher.new 'aes-256-gcm'
cipher.encrypt
iv = cipher.random_iv

pwd = 'strong'
salt = OpenSSL::Random.random_bytes 16
iter = 20000
key_len = cipher.key_len
digest = OpenSSL::Digest::SHA256.new

key = OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
cipher.key = key

#Now encrypt the data:

encrypted = cipher.update data
encrypted << cipher.final
puts "#{encrypted.unpack("H*").first}"

# Decrypt

cipher.decrypt
cipher.iv = iv # the one generated with #random_iv

key = OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
cipher.key = key

#Now decrypt the data:

decrypted = cipher.update encrypted
decrypted << cipher.final
puts "#{decrypted}"
