# config/initializers/money.rb

require 'money'
require 'money/bank/cryptocompare'

# Register custom cryptocurrencies if needed
currencies = [
  {
    priority: 1,
    iso_code: "BTC",
    name: "Bitcoin",
    subunit: "Satoshi",
    subunit_to_unit: 100_000_000,
  },
  {
    priority: 1,
    iso_code: "ETH",
    name: "Ethereum",
    subunit: "Wei",
    subunit_to_unit: 1_000_000_000_000_000_000,
  },
  {
    priority: 1,
    iso_code: "LTC",
    name: "Litecoin",
    subunit: "Litoshi",
    subunit_to_unit: 100_000_000,
    
  },
  {
    priority: 1,
    iso_code: "XRP",
    name: "Ripple",
    subunit: "Drops",
    subunit_to_unit: 1_000_000,
  },
  {
    priority: 1,
    iso_code: "BCH",
    name: "Bitcoin Cash",
    subunit: "Satoshi",
    subunit_to_unit: 100_000_000,
  },
  {
    priority: 1,
    iso_code: "BNB",
    name: "Binance Coin",
    subunit: "Penny",
    subunit_to_unit: 100,
  },
  {
    priority: 1,
    iso_code: "USDT",
    name: "Tether",
    subunit: "Cent",
    subunit_to_unit: 100,
  },
  {
    priority: 1,
    iso_code: "ADA",
    name: "Cardano",
    subunit: "Lovelace",
    subunit_to_unit: 1_000_000,
  },
  {
    priority: 1,
    iso_code: "DOGE",
    name: "Dogecoin",
    subunit: "Koinu",
    subunit_to_unit: 1,
  },
  {
    priority: 1,
    iso_code: "DOT",
    name: "Polkadot",
    subunit: "Planck",
    subunit_to_unit: 1,
    
  }
]

currencies.each do |currency|
  Money::Currency.register(currency)
end

# Initialize the bank with options if needed
bank = Money::Bank::Cryptocompare.new

# Set the default bank for Money
Money.default_bank = bank
