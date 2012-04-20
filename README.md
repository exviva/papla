## Papla [![Build Status](https://secure.travis-ci.org/exviva/papla.png)](http://travis-ci.org/exviva/papla)

Papla is a Ruby gem that allows you to convert numbers into Polish
and English words (e.g. `153` into `"Sto pięćdziesiąt trzy"`
or `44` into `"Forty four"`), including the decimal part as cents
and currency symbol. Its primary use case are invoices, where
the total amount has to be displayed as words at the bottom line.

### Installation

To install Papla, run

    gem install papla

or add

```ruby
gem 'papla'
```

to your `Gemfile`.

### Usage

#### Basic examples

```ruby
I18n.locale = :pl
Papla[158] # => "Sto pięćdziesiąt osiem"
Papla[1_234] # => "Tysiąc dwieście trzydzieści cztery"
Papla[987_654_321] # => "Dziewięćset osiemdziesiąt siedem milionów sześćset pięćdziesiąt cztery tysiące trzysta dwadzieścia jeden"

I18n.locale = :en
Papla[1_234] # => "One thousand two hundred thirty four"
```

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

#### Money

If you're using the `money` gem, you can pass in an instance of `Money` to Papla.
The returned string will contain the dollars part as words,
the cents part as 'xx/100' and the currency string (e.g. `EUR`).

Example:

```ruby
eleven_and_a_half_pounds = Money.new(1150, 'GBP')
Papla[eleven_and_a_half_pounds] # => "Jedenaście 50/100 GBP"

I18n.locale = :en
discounted_price = Money.new(9999, 'PLN')
Papla[discounted_price] # => "Ninety nine 99/100 PLN"
```

### I18n

Localization is provided by I18n. See `lib/papla/backend.rb`
for details of keys used. Currently `:pl` and `:en` locales are supported.

Note: English support is not fully correct, e.g. `123` becomes
`"One hundred twenty three"` and not `"One hundred and twenty three"`.

### Documentation

Documentation is available at [RubyDoc.info](http://rubydoc.info/github/exviva/papla/master/frames).
