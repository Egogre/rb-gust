
## Development Dependencies
require 'pry'

## Load Gust
require 'gust'

## Sample Application
#APP_ROOT = File.join(File.dirname(__FILE__), 'app')

## Configure RSpec
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

## Spec Helpers
#Dir[File.join(File.dirname(__FILE__), 'helpers', '**', '*_helper.rb')].each do |f|
#  require f
#end

