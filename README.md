# Invariant

`Invariant` is a simple gem that provides `Kernel#assert` to document your assumptions in code.

> Use assertions to prevent the impossible.
> 
> Whenever you find yourself thinking "but of course that could never happen,"
> add code to check it. The easiest way to do this is with assertions. 
>
> http://pragmatictips.com/33


## Installation

Add to Gemfile:

    gem 'invariant'


## Configuration

Assertions are enabled by default. Better safe than sorry. To disable assertions:

```ruby
Invariant.disable_assertions
```

For example, in Rails you may want to disable assertions in Production:

```ruby
# config/initializers/invariant.rb
Invariant.disable_assertions if Rails.env.production?
```

## Usage

Use `assert` to test a condition:

```ruby
assert age > 0
```

Provide an optional message:

```ruby
assert errors.empty?, "Why do we still have errors?"
```

You can also test a block of code. This is handy when you're invariant requires several lines of code.

```ruby
assert do
  one_thing = calculate_something
  other_thing = calculate_something_else
  one_thing > other_thing
end
```

Blocks also support an optional message:

```ruby
assert 'That one thing should always be greater' do
  one_thing = calculate_something
  other_thing = calculate_something_else
  one_thing > other_thing
end
```

## Errors

A failed assertion raises `Invariant::AssertionError` which inherits directly from `Exception`.

An `AssertionError` should be an *exceptional* failure. It should not be something a program knows how to recover from. This is why `AssertionError` is not a `StandardError`:

```ruby
  def real_world
    assert 1 == 0, 'We are in the real world'
  rescue
    'We are in the Matrix'
  end

  real_world # => raises Invariant::AssertionError, 'We are in the real world'
```
  
