# ArrayAssociation

[![Build Status](https://semaphoreci.com/api/v1/igormalinovskiy/array_association/branches/master/shields_badge.svg)](https://semaphoreci.com/igormalinovskiy/array_association)
[![Code Climate](https://codeclimate.com/github/psyipm/array_association/badges/gpa.svg)](https://codeclimate.com/github/psyipm/array_association)
[![Gem Version](https://badge.fury.io/rb/array_association.svg)](https://badge.fury.io/rb/array_association)

ActiveRecord-like association for Postgres Array columns
This gem defines some helpers to use array columns like assiciated models

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'array_association'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install array_association

## Usage

```ruby
class User < ApplicationRecord
  include ArrayAssociation
  array_column :order_ids, :orders, { class: Order }
end
```

in this case the following methods will be defined:
* `orders`, which returns collection of Order
* `order_ids=`, which sets normalized order_ids
* `orders=(values)`, which maps collection and sets order_ids

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/psyipm/array_association.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
