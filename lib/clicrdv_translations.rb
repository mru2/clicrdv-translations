require "clicrdv_translations/version"
require "clicrdv/translations"

module ClicrdvTranslations
  
  module Helpers
    class << self
      
      # Helper : flatten a hash (keys to array)
      # IN  : foo => { bar => baz }
      # OUT : [foo, bar] => baz
      def flat_hash(hash, k = [])
        return {k => hash} unless hash.is_a?(Hash)
        hash.inject({}){ |h, v| h.merge! flat_hash(v[-1], k + [v[0]]) }
      end

    end
  end
end
