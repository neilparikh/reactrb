# Reactive Ruby

This is my implementation of [reactive programming](https://en.wikipedia.org/wiki/Reactive_programming) in Ruby.

## Quick example

```ruby
require './reactrb'

a = ReactRB.new(1)
b = ReactRB.new(2)
c = ReactRB.new.depends_on(a, b) do |var1, var2|
  var1 + var2**2
end

puts c #=> 5

a.value = 10
b.value = 5
puts c #=> 35
```

## Todo
* Refactor code
* Documentation
* Tests
* Convert to a gem
* Improved API
