![DIBS Logo][1]

# Spree Payment Gateway for DIBS

[![Dependency Status](https://gemnasium.com/futhr/spree-dibs.png)](https://gemnasium.com/futhr/spree-dibs)
[![Code Climate](https://codeclimate.com/github/futhr/spree-dibs.png)](https://codeclimate.com/github/futhr/spree-dibs)

[DIBS Payment Services][2], the largest provider of Internet payment solutions in Northern Europe.

## Installation

Add spree_dibs and this branch of active merchant to your `Gemfile`

```ruby
gem 'spree_dibs', github: 'futhr/spree-dibs', branch: 'master'
gem 'activemerchant', github: 'futhr/active_merchant', branch: 'dibspayment'
```

**NOTE** _This cannot be used with official `active_merchant` gem due to that the DIBS gateway was never merged. This because DIBS do not have a sandbox to run CI tests against.

### Heroku SSL gotcha

To make this work if you deploy on Heroku you need to add this to your Rails app in `config/initialzers/dibs.rb`.
You also need to include this code snippet to make your tests pass.

```ruby
require 'net/http'

Net::HTTP.class_eval do
  def do_start
    # Start Hack
    @ssl_version = :SSLv3 if @address =~ /.*\.dibspayment\.com/
    # PREPARE', End Hack
    connect
    @started = true
  end
end
```

---

## Contributing

In the spirit of [free software][3], **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting [bugs][4]
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (*no patch is too small*: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues][4]
* by reviewing patches

Issue/feature related questions can be asked thru [Gitter chat](https://gitter.im/futhr/spree-dibs).

Starting point:

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against. Make sure to create `spec/support/config.yml` from the sample file and modify the `merchantid` and `hmackey` variables from your DIBS account information.

* Fork the repo
* Clone your repo
* Run `bundle install`
* Add config for *your* DIBS account
* Run `bundle exec rake test_app` to create the test application in `spec/test_app`
* Make your changes
* Ensure specs pass by running `bundle exec rspec spec`
* Submit your pull request

Copyright (c) 2014 [Tobias Bohwalli][5], [FreeRunning Technologies][6] and [contributors][7], released under the [New BSD License][8]

[1]: https://raw.github.com/futhr/spree-dibs/master/dibs.png
[2]: http://www.dibspayment.com
[3]: http://www.fsf.org/licensing/essays/free-sw.html
[4]: https://github.com/futhr/spree-dibs/issues
[5]: https://github.com/futhr
[6]: https://github.com/freerunningtechnologies
[7]: https://github.com/futhr/spree-dibs/contributors
[8]: https://github.com/futhr/spree-dibs/tree/master/LICENSE.md
