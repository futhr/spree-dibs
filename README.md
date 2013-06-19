DIBS Payment Gateway for Spree 2.0.X
====================================

Installation
------------

Add spree_dibs and this branch of active merchant to your Gemfile:

```ruby
gem 'spree_dibs', github: 'freerunningtechnologies/spree-dibs'
gem 'activemerchant', github: 'maxwhite/active_merchant', branch: 'dibspayment'
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against. Make sure to edit spec/models/gateway/dibs.rb and modify the login and password variables to use your DIBS account information.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

Copyright (c) 2013 FreeRunning Technologies & Tobias Bohwalli, released under the New BSD License
