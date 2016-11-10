# pipekit-webmock

This is a [WebMock](https://github.com/bblimke/webmock) extension to stub requests to [Pipedrive](http://www.pipedrive.com) with the [pipekit](https://github.com/makersacademy/pipekit) gem.

It provides a `stub_pipedrive_request` method and readable error messages for unregistered requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pipekit-webmock'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipekit-webmock

## Usage

```ruby
# spec/spec_helper.rb

require "pipekit/webmock"
```

To use `pipekit` you will need a dummy Pipedrive config for your tests. Create a file with Pipedrive field mapping in `spec/support/config.yml`. Then add the following to your `spec_helper`:

```ruby
# Dummy config data
Pipekit.config_file_path = File.join(File.dirname(__FILE__), "support", "config.yml")
```

To stub requests to Pipedrive use `stub_pipedrive_request` method where you would normally use `WebMock`'s `stub_request` with the following params:

- `resource` - what "entity" is request made to. Possible values are:
  - `:person`
  - `:deal`
  - `:note`
  - `:personField`
- `action`:
  - `:get` - Stubs a `GET` request to get resource by id or a query string.
  - `:create` - Stubs a `POST` request to create a resource.
  - `:update` - Stubs a `PUT` request to update the resource. `params` hash should include `id`.
  - `:search` - Stubs a `GET` request to the `searchResults` endpoint.
  - `:find_by_person_id` - Only for the `deal` resource. Stubs a `GET` request to `persons/:id/deals` on Pipedrive.
  - `:find_by_email` - Only for the `person` resource. Stubs a `GET` request to `persons` with `search_by_email=1` query param on Pipedrive.
  - `:find_by_name` - Only for the `person` resource. Stubs a `GET` request to `persons` on Pipedrive.
- `params` - a hash of parameters. Could be either a query string (for `GET` requests) or a body (for `POST` and `PUT`) requests. For `update` action must include `:id` (as a symbol). Custom Pipedrive fields **don't** have to be converted to their Pipedrive ids.
- `response` - what stubbed request should return. Note that most `GET` requests return an array, even if there's only one match.

## Examples

```ruby
stub_pipedrive_request(
  resource: :person,
  action: :create,
  params: {
    "email" => "octocat@github.com",
    "name" => "Octocat",
    "middle_name" => "Purr" # custom Pipedrive field
  },
  response: {id: 123}
)

stub_pipedrive_request(
  resource: :deal,
  action: :update,
  params: {
    id: 123,
    stage: "1st Contact"
  },
  response: {id: 123}
)

stub_pipedrive_request(
  resource: :person,
  action: :find_by_email,
  params: {
    email: "octocat@gmail.com"
  }
  response: [{id: 123}] # notice the array
)

stub_pipedrive_request(
  resource: :deal,
  action: :find_by_person_id,
  params: {
    person_id: 123
  },
  response: [{id: 345}]
)

stub_pipedrive_request(
  resource: :person,
  action: :search,
  params: {
    "Middle name" => "Purr" # custom Pipedrive field
  },
  response: [{id: 123}]
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pipekit-webmock. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

