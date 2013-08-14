# Time::Elapsed

Adds elapsed time functionality to ruby Time objects

## Installation
``` 
  gem install time-elapsed
```
## Usage
```
  require 'time-alapsed'
```
##  Examples
```
  Time.now.plus('2 minutes 32 seconds')
  Time.now.minus('3 weeks and 3 days and 32 hours')
  Time.now + Time::Elapsed.time('34m30s')
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
