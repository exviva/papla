# Papla

Papla is a Ruby gem that allows you to convert numbers into Polish words (e.g. `153` into `"sto pięćdziesiąt trzy"`), including the decimal part as cents and currency symbol. Its primary use case are invoices, where the total amount has to be displayed as words at the bottom line.

## Examples

    Papla.convert(158) # => 'Sto pięćdziesiąt'
    Papla.convert(1_234) # => 'Tysiąc dwieście trzydzieści cztery'
    Papla.convert(987_654_321) # => 'Dziewięćset osiemdziesiąt siedem milionów sześćset pięćdziesiąt cztery tysiące trzysta dwadzieścia jeden'

### Cents and currency

This feature is planned for future releases.

## Integration with Money, I18n and Rails

This feature is planned for future releases.
