=======
omniauth-workxp
===============

Official OmniAuth strategy for Workxp.

## Installation

Add this line to your application's Gemfile:

	gem 'omniauth-workxp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-workxp

## Usage
Example with devise:

#### routes:
     devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks"}
#### user.rb:
    open omniauthable:
		devise :omniauthable
#### controller:
     rails g controller omniauth_callbacks --skip-helper --skip-assets
     class OmniauthCallbacksController < ApplicationController
  def all
    auth = request.env["omniauth.auth"]
    raise auth.to_yaml
  end
 
  alias_method :workxp, :all
end
#### devise.rb:
     config.omniauth :workxp, 'a9acabbfd9be74d4f77d2227b7621e18c7ba6290d87459801014039f8af63290', '0deb222c9602cedefc7ba17f6820e5c926e20bc9113406ec8fd71fff678189f0'    

views:
     <%= link_to "login by workxp", http://lvh.me:3000/users/auth/workxp %>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


