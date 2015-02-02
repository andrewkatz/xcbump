# Xcbump

Bumps the version and build numbers for an Xcode project. Uses semantic versioning for both
numbers. This is also based on a versioning scheme I use in the build version number, where the
fourth digit signifies the build number.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xcbump'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xcbump

## Usage

Configure the gem:

    $ xcb --configure

    Project Name?  MyProject
    Config file written to 'xcbump.yml'.

Bump major version:

    $ xcb --major

    Current version: 1.2.4 (1.2.4.1)
    New version: 2.0.0 (2.0.0.0)

Bump minor version:

    $ xcb --minor

    Current version: 1.2.4 (1.2.4.1)
    New version: 1.3.0 (1.3.0.0)

Bump patch version:

    $ xcb --patch

    Current version: 1.2.4 (1.2.4.1)
    New version: 1.2.5 (1.2.5.0)

Bump build version:

    $ xcb --build

    Current version: 1.2.4 (1.2.4.1)
    New version: 1.2.4 (1.2.4.2)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/xcbump/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
