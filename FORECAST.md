Gust Forecast
=============

The Gust Forecast is a list of feature ideas that would be nice to have.  Ideally, this list is prioritized. (Maybe this list should be moved to Pivotal Tracker)

### Objects have attribute accessors

```ruby
boulder = objects.cities.first
#=> {:name=>"Boulder", :state=>"CO", :"favorite fruit id"=>3.0}
boulder.name.should == "Boulder"
boulder.state.should == "CO"
boulder.favorite_fruit_id.should == 3
```

### Objects are associable via sql-like foreign key attributes

Association headings should take the form:

\* singular-table-name heading

So, if the cities table wanted to have an association to their favorite fruit, then it needs a column with one of these headers:

+ favorite fruit id
+ fruit id
+ favorite fruit type
+ fruit type
+ favorite fruit juicable?  (This would match on the first matching value)
+ fruit juicable?

This would allow you to call #favorite_fruit or #fruit on any city object.

### Title Row, Header Row, and Object Row are configurable

```ruby
Gust.load(spreadsheet_filepath, config_hash)
Gust.config do |gust|
  gust.title_row = 5
  gust.object_row = 6
end
```

### Rails Plugin

### Builds/Saves objects into Rails Models

### Compatibility with more filetypes (using roo)

### Formula Handling

+ Get true/false values
+ Formula specific methods/accessors

### Multiple Tables Vertically stacked in One Spreadsheet

### Remove Active Support Dependency (if it's easy)

### Spreadsheets (files) are editable
