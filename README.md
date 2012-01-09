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

This feature is planned for future releases.

### Integration with Money, I18n and Rails

This feature is planned for future releases.

## Documentation

Documentation is available at [RubyDoc.info](http://rubydoc.info/github/exviva/papla/master/frames).
