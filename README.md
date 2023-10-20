# Pronto::AnnotationsFormatter

Welcome!

[prontolabs/pronto](https://github.com/prontolabs/pronto) is a great tool for code review, but it post the warnings as comments,
which can be a bit of a mess and create many comments on the PR causing a huge noise for developers discussion.

In a combination [pronto-annotate-action](https://github.com/emilio2hd/pronto-annotate-action), it's possible to write annotations to the code, like this:

![Annotation Warning on Code](https://raw.githubusercontent.com/emilio2hd/pronto-annotate-action/main/docs/annotation-warning-on-code.png)
Leaving the comments just for the developers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pronto-annotations_formatter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pronto-annotations_formatter

## Usage

```
bundle exec pronto run -f annotations -c origin/main
```
The command above, will print some json like this:
```json
[
  {
    "message": "Migration file detected, but no changes in schema.rb",
    "level": "warning",
    "file": "db/migrate/20231013225210_create_products.rb",
    "line": {
      "start": 1,
      "end": 1
    },
    "title": "Pronto::RailsSchema"
  }
]
```

## Development

Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/emilio2hd/pronto-annotations_formatter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
