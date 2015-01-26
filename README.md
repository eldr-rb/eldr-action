# Eldr::Action

A simple action object for [Eldr](https://github.com/eldr-rb/eldr). You can include it and make any class compatible with an Eldr route. You'll get validations and params for free.
Eldr::Action's respond to `call(env)` and return a valid rack response.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eldr-action'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eldr-action

## Usage

Just include it your handler:

```ruby
module Cats
  class Show
    include Eldr::Action

    def call(env)
      @env = env

      Rack::Response.new 'Found the cat!'
    end
  end
end
```

Then pass it to a route in an Eldr::App:

```ruby
class App < Eldr::App
  get '/', Cats::Show.new
end
```
