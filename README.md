# mongoid-simple-roles [![build status](https://secure.travis-ci.org/drefined/mongoid-simple-roles.png?branch=master)](http://travis-ci.org/drefined/mongoid-simple-roles)

Very basic and simple roles system for mongoid v3. HEAVILY INSPIRED by [mongoid-simple-tags](https://github.com/chebyte/mongoid-simple-tags)

## Install

Add the following to Gemfile:

```ruby
gem "mongoid-simple-roles", "0.0.1"
```

## Usage

### Model

```ruby
class User
  include Mongoid::Document
  include Mongoid::Document::Roleable
end
```

### Console

```ruby
u = User.create(:name => "Drefined", with_roles: ['superadmin', 'admin', 'user'])

u.roles
=> ['superadmin', 'admin', 'user']

User.find_roles('superadmin')
=> u

u2 = User.new(:name => "Quicksorter")
u2.add_role('admin')
u2.add_role('user')
u2.save

u2.has_role?('admin')
=> true

u2.remove_role('user')
u2.has_role?('user')
=> false

User.find_roles('admin')
=> [u, u2]
```

## Questions or Problems?

If you have any issue or feature request with/for mongoid-simple-roles, please add an [issue on GitHub](https://github.com/drefined/mongoid-simple-roles/issues) or fork the project and send a pull request.