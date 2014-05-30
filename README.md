# ClicrdvTranslations

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'clicrdv_translations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clicrdv_translations

## Usage

```
# Initialize with
# - the API key of the localeapp project (mandatory)
# - the path to a writeable folder for the .yml files and sync data (optional, defaults to /tmp)

client = ClicRDV::Translations.new('api_key', File.join(File.dirname(__FILE__), '.tmp'))

# Get the translations
translations = client.translations
# => { 'en' => {'foo' => 'bar'}, 'fr' => {'foo' => 'baz', 'boo' => {'bar' => 'baz'} } }

# Get flattened translations (only key/value)
translations = client.translations(:flatten => true)



```

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/clicrdv_translations/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
