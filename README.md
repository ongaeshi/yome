# Yome
A tool to generate code-reading documents using annotated comments.

Embedding a markup of the form `YOME:` in the source code creates a markdown sentence in which text and source code are arranged in order.

## Installation
You can install from RubyGems.

    $ gem install yome

Binary for Windows is also available.
Please download and place it in the place where passes passed.

- [Releases · ongaeshi / yome](https://github.com/ongaeshi/yome/releases/)

## How to use
I will write comment annotations while reading source code. In the sample [only for one file](https://github.com/ongaeshi/yome/blob/master/test/data/simple/simple.rb) Although annotated comment is described, even if it spans multiple files does not matter.

```ruby
# YOME:title Yome simple test
# YOME:summary This is a simple sample
# YOME:url https://github.com/ongaeshi/yome/tree/master/test/data/simple

# YOME:4 require
require "dir"

# YOME:1 Define class
class Simple
  # YOME:3 attr_reader
  attr_reader :x

  # YOME:1.1 Initialize
  def initialize(x)
    @x = x
  end


  # YOME:2 Method
  # YOME: The *to_double* method doubles x and returns it.
  # YOME: double
  def to_double
    2 * x
  end
end
```

After you add a comment, execute the yome command.Annotated comments and related codes are excerpted and displayed in order of numbers.

````bash
$ cd ~/src
$ yome
# Yome simple test
This is a simple sample

https://github.com/ongaeshi/yome/tree/master/test/data/simple


## Define class
*simple.rb*


```ruby
class Simple
```
````

Output to file with `-o`.

```bash
$ yome -o simple.md
```

## Reference Manual
### YOME: no (section)
If you write a number without spaces after `YOME:` it will be a section. It is output after converting `YOME: (comment)` below yourself and source code into one, converting it into markdown `##` in order of numbers.

Decimal points can also be used for numbers. It is okay if the middle of the number is empty.

```ruby
# YOME:1 First section
class Simple
  # YOME:10 Second section
  def foo
  end

  # YOME:    3 This is not a section
  def bar
  end
end  
```

### YOME: (comment)
If you leave a blank after `YOME:`, it will be a comment. It becomes a markdown paragraph.

```ruby
# YOME:1 First section
# YOME: First section's comment
class Simple
  # YOME:10 Second section
  # YOME: Second section's comment
  # YOME: Next comment
  def foo
  end
end  
```

### YOME:title
If you leave a blank after `YOME:title`, it will be titled. It is converted to mark-down `#` and output. The place to describe does not have to be at the beginning of the file.

```ruby
# YOME:title Simple class

# YOME:1 First section
# YOME: First section's comment
class Simple
end  
```

### YOME:summary
If you leave a blank after `YOME:summary`, it will be a summary. It is output as a paragraph after markdown `#`. The place to describe does not have to be at the beginning of the file.

```ruby
# YOME:title Simple class
# YOME:summary Behavior of simple class

# YOME:1 First section
# YOME: First section's comment
class Simple
end  
```

### YOME:url
If you leave a blank after `YOME:url` it will be a URL. Output URL after markdown `#`. The place to describe does not have to be at the beginning of the file.

```ruby
# YOME:title Simple class
# YOME:summary Behavior of simple class
# YOME:url https://github.com/ongaeshi/yome

# YOME:1 First section
# YOME: First section's comment
class Simple
end  
```

### YOME:end
The code excerpt range of the section is 8 lines or the next section. If you want to extract a long code range please use `YOME:end`.

```ruby
  # YOME:5 YOME:end
  # YOME: You can display long distance with `YOME:end`.
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
  # YOME:end
```

## Command line option
You can specify the source code position, output file name, unsupported source code type, and so on.

```
$ yome -h
Usage: yome [DIR] [options]
    -o FILE                          Output file name
        --lang LANG                  Specify code blocks language
```

## Cooperation with Git
You can use yome alone, but it is more convenient when combined with Git.

```
# Clone the source code you want to read
$ git clone https://github.com/mruby/mruby.git
$ cd mruby

# Convenient to cut branch for work
$ git checkout -b yome/gc

# After you write comments, let's keep it committed regularly
$ git commit

# Switching branches when reading other code areas
# You can generate it as a separate document.
$ git checkout master
$ git checkout -b yome/array
```