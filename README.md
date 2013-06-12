# Reactive Ruby

This is my implementation of [reactive programming] in Ruby.

## Quick example

```ruby
include './reactrb'

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
* Tests
* Documentation
* Convert to a gem
* Improved API