# ClicRDV::Translations

## Installation

Add this line to your application's Gemfile:

    gem 'clicrdv_translations', :git => 'https://github.com/mru2/clicrdv-translations.git', :require => false

And then execute:

    $ bundle


## Usage

```ruby
require 'clicrdv_translations'

# Initialize with
# - the API key of the localeapp project (mandatory)
# - the path to a writeable folder for the .yml files and sync data (optional, defaults to /tmp)

client = ClicRDV::Translations.new('api_key', File.join(File.dirname(__FILE__), '.tmp'))

# Get the translations
translations = client.translations
# => { 'en' => {'foo' => 'bar'}, 'fr' => {'foo' => 'baz', 'boo' => {'bar' => 'baz'} } }

# Get flattened translations (only key/value)
translations = client.translations(:flatten => true)
# => { 'en' => {'foo' => 'bar'}, 'fr' => {'foo' => 'baz', 'boo.bar' => 'baz' } }
```