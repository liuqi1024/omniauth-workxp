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



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


