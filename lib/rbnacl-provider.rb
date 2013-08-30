require 'rbnacl'

module Example

  module Provider
    class RbNaCl

      def initialize
      end

      def new_service(clazz, *args)
        if clazz == Krypt::Digest
          Digest.new
        else
          nil
        end
      end

      def name
        "RbNaClProvider"
      end

      def finalize
      end
    end
  end

  class Digest 

    %w(SHA256 SHA512).each do |alg|
      mod = Module.new do
        define_singleton_method(:new) { Digest.new(alg) }
      end
      const_set(alg, mod)
    end

    def initialize(alg)
      @@alg = alg.downcase
    end

    def hexdigest(data=nil)
      Crypto::Hash.send(@@alg, data, :hex)
    end

    def digest_length
    end

    def block_length
    end

    def name
    end

    private

    def digest_finalize
    end
  end
end

