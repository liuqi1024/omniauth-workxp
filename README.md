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

`OmniAuth::Strategies::WorkXP` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :workxp, ENV['WORKXP_KEY'], ENV['WORKXP_SECRET']
end
```


## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'workxp',
  :uid => 'user email',
  :info => {
    :email => 'yuanping@workxp.info',
    :name => '袁平',
    :image => 'http://workxp.info/avatar.png',
    :accounts => {
      "company": "容平志远科技（北京）有限公司", 
      "domain": "rongping"
    }
  },
  :credentials => {
    :expires => false,
    :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
    :refresh_token => 'decfa',
    :expires_at => 1321747205 # when the access token expires (it always will)
  },
  :extra => {
    :raw_info => {
        "identity": {
            "id": 12,
            "name": "袁平",
            "email": "yuanping@workxp.info",
            "avatar_url": "http://workxp.info/avatar.png"
        },
        "accounts": {
            "company": "容平志远科技（北京）有限公司", 
            "domain": "rongping"
        }
    }
  }
}
```

The precise information available may depend on the permissions which you request.

## Integrating OmniAuth Into Your Application
OmniAuth is an extremely low-touch library. It is designed to be a black box that you can send your application's users into when you need authentication and then get information back. OmniAuth was intentionally built not to automatically associate with a User model or make assumptions about how many authentication methods you might want to use or what you might want to do with the data once a user has authenticated. This makes OmniAuth incredibly flexible. To use OmniAuth, you need only to redirect users to `/auth/:provider`, where :provider is the name of the strategy (for example, workxp). From there, OmniAuth will take over and take the user through the necessary steps to authenticate them with the chosen strategy.

OmniAuth simply sets a special hash called the Authentication Hash on the Rack environment of a request to `/auth/:provider/callback`.

In a Rails app I would add a line in my routes.rb file like this:
```
get '/auth/:provider/callback', to: 'sessions#create'
```

And I might then have a SessionsController with code that looks something like this:
```
class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


