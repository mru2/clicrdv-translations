module ClicRDV

  class Translations

    require 'localeapp'
    
    def initialize(api_key, tmp_directory = '/tmp')
      @localeapp = Localeapp
      @dir = tmp_directory

      @localeapp.configure do |config|
        config.api_key = api_key
        config.translation_data_directory = tmp_directory
        config.synchronization_data_file  = File.join(tmp_directory, 'sync.yml')
      end
    end


    def translations(opts = {})

      update_local_translations!

      res = get_local_translations

      if opts[:flatten]
        res.each do |locale, tree_translations|
          res[locale] = flatten_tree_translations(tree_translations)
        end
      end

      res
    end



    private

    # Sync the local .yml files from the localeapp server
    def update_local_translations!

      # First run : set updated at 6 months in the past, 422 otherwise...
      if @localeapp.poller.updated_at == 0
        @localeapp.poller.updated_at = Time.now.to_i - 6*30*24*60*60
      end

      @localeapp.poller.poll!
    end

    # Parse and load the local .yml files in a hash
    def get_local_translations(flatten = false)
      res = Hash.new

      Dir.glob(File.join @dir, '*.yml').each do |file|
        next if File.basename(file) == 'sync.yml'
        res.merge! YAML.load_file(file)
      end

      res
    end

    # Convert a translations hash {'foo' => {'bar' => 'baz'}} to the format {'foo.bar' => 'baz'}
    def flatten_tree_translations(tree_translations)
      flattened_translations = ClicrdvTranslations::Helpers.flat_hash(tree_translations)

      return {}.tap do |res|
        flattened_translations.each do |keys, value|
          res[keys.join('.')] = value
        end
      end
    end

  end
end

