Gust Forecast
=============

The Gust Forecast is a list of feature ideas that would be nice to have.  Ideally, this list is prioritized. (Maybe this list should be moved to Pivotal Tracker)

### Object groups accessible by title name

For Example:

+ basic_objects.vehicles
+ basic_objects.fruits
+ basic_objects.cities
+ basic_object.vehicles.first.color

### Title Row, Header Row, and Object Row are configurable

```ruby
Gust.load(spreadsheet_filepath, config_hash)
Gust.config do |gust|
  gust.title_row = 5
  gust.object_row = 6
end
```

### Objects are associable via sql-like foreign key attributes

### Rails Plugin

### Builds/Saves objects into Rails Models

### Compatibility with more filetypes (using roo)

### Formula Handling

+ Get true/false values
+ Formula specific methods/accessors

### Multiple Tables Vertically stacked in One Spreadsheet

### Remove Active Support Dependency (if it's easy)

### Spreadsheets (files) are editable
