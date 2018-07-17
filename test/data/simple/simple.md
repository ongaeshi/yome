# Yome simple test
This is a simple sample

https://github.com/ongaeshi/yome/tree/master/test/data/simple


## Define class
*simple.rb*


```ruby
class Simple
```



## Initialize
*simple.rb*


```ruby
  def initialize(x)
    @x = x
  end
```



## Method
*simple.rb*



The *to_double* method doubles x and returns it.
double

```ruby
  def to_double
    2 * x
  end
```
tripple

```ruby
  def to_tripple
    3 * x
  end
```

## attr_reader
*simple.rb*


```ruby
  attr_reader :x
```



## require
*simple.rb*


```ruby
require "dir"
```



## YOME:end
*simple.rb*



You can display long distance with `YOME:end`.

```ruby
  def long_method
    1 +
    2 +
    3 +
    4 +
    5 + 
    6 +
    7 +
    8 +
    9 +
    10
  end
```

## Default distance is 8
*simple.rb*


```ruby
  def long_method2
    1 +
    2 +
    3 +
    4 +
    5 + 
    6 +
    7 +
```



