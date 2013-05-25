# Gust

Gust allows you to load many objects from an excel spreadsheet (.xls only) into Ruby objects.

```ruby
objects = Gust.load('/path/to/spreadsheet.xls')
```

... and you're off!

## Installation

Add this line to your application's Gemfile:

    gem 'rb-gust'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rb-gust

## Usage

Format a Spreadsheet (see the example spreadsheet [here](spec/workbooks/basic_objects.xls)):

+ first row with content as the object titles.
+ second row has column headers
+ third row begins the object data values

To load the objects into Ruby, use `Gust.load()`. An RSpec example:

```ruby
objects = Gust.load('/gust_gem_path/spec/worksheets/basic_objects.xls')
objects[:vehicles].should eq(
  [
    {:name=>"sedan", :wheels=>4.0, :color=>"blue"},
    {:name=>"sports car", :wheels=>4.0, :color=>"red"},
    {:name=>"moving truck", :wheels=>6.0, :color=>"white"},
  ]
)
```

## Contributing

Check out the [feature forecast](FORECAST.md) for desired features.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
