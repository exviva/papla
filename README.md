# Papla [![Build Status](https://secure.travis-ci.org/exviva/papla.png)](http://travis-ci.org/exviva/papla)

Papla is a Ruby gem that allows you to convert numbers into Polish words (e.g. `153` into `"sto pięćdziesiąt trzy"`), including the decimal part as cents and currency symbol. Its primary use case are invoices, where the total amount has to be displayed as words at the bottom line.

## Installation

To install Papla, run

    gem install papla

or add

```ruby
gem 'papla'
```

to your `Gemfile`.

## Usage

### Basic examples

```ruby
Papla[158] # => "Sto pięćdziesiąt osiem"
Papla[1_234] # => "Tysiąc dwieście trzydzieści cztery"
Papla[987_654_321] # => "Dziewięćset osiemdziesiąt siedem milionów sześćset pięćdziesiąt cztery tysiące trzysta dwadzieścia jeden"
```

### Cents and currency

#### Cents

When given a `Float`, Papla will assume that the decimal part represents cents.
It will then round the number using `Float#round` to two decimal places,
and append the number of cents divided by hundred to the resulting string.

Example:

```ruby
Papla[1.0] # => "Jeden 00/100"
Papla[87.654321] # => "Osiemdziesiąt siedem 65/100"
Papla[2.999] # => "Trzy 00/100"
```

#### Currency

This feature is planned for future releases.

## Integration with Money, I18n and Rails

### I18n

Localization is provided by I18n. See `lib/papla/backend.rb` for details of keys used.

### Money, Rails

This feature is planned for future releases.

## Documentation

Documentation is available at [RubyDoc.info](http://rubydoc.info/github/exviva/papla/master/frames).
