# Calendarium Romanum Spec

Specs for implementations of the Roman Catholic church
calendar.
[calendarium-romanum][caro] is being used as reference implementation.
Running this test suite against your own implementation
of the calendar system you can check how feature-complete
your calendar library is.

## How to make it work

(There is no real installation and there will never be one.)

Get the sources, run `bundle install` in the source directory.

## Usage

The test-suite is language agnostic.
The implementation under test is expected to provide an executable
which receives date and calendar setup through command line
arguments and prints JSON-encoded calendar data
to it's standard output.

```
SPECLI=/path/to/your/executable bundle exec rspec
```

## License

dual-licensed: freely choose between GNU/GPL 3 and MIT

[caro]: https://github.com/igneus/calendarium-romanum
