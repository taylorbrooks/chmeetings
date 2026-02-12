# Chmeetings

A Ruby wrapper for the [ChMeetings API](https://api.chmeetings.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chmeetings'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chmeetings

## Usage

```ruby
client = Chmeetings::Client.new(api_key: 'your_api_key')

# People
client.list_people
client.create_person(first_name: 'John', last_name: 'Doe')
client.update_person(person_id: 1, first_name: 'Jane')
client.delete_person(person_id: 1)

# Families
client.list_families
client.create_family(name: 'Doe Family')
client.get_family(family_id: 1)
client.update_family(family_id: 1, name: 'Smith Family')
client.delete_family(family_id: 1)

# Family Members
client.list_family_members(family_id: 1)
client.create_family_member(family_id: 1, person_id: 1)
client.update_family_member(id: 1, family_id: 1, person_id: 2)
client.patch_family_member(id: 1, role: 'Head')
client.delete_family_member(id: 1)

# Groups
client.list_groups

# Contributions
client.list_contributions
client.create_contribution(person_id: 1, amount: 100.0)

# Pledges
client.list_pledges

# Campaigns
client.list_campaigns
```

You can also configure the client using the `CHMEETINGS_API_KEY` environment variable:

```ruby
client = Chmeetings::Client.new
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
