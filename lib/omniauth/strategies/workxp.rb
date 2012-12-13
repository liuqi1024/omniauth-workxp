require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Workxp < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://workxp.info'
      }

      def request_phase
        super
      end
      
      def authorize_params
        if request.params["scope"]
          super.merge({:scope => request.params["scope"]})
        else
          super
        end
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'nickname' => raw_info['login'],
          'email' => email,
          'name' => raw_info['name'],
          'image' => raw_info['avatar_url'],
          'urls' => {
            'Workxp' => "https://workxp.info/#{raw_info['login']}",
            'Blog' => raw_info['blog'],
          },
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :header
        @raw_info ||= access_token.get('/api/users/me.json', {:headers =>{'Sub-Domain' => 'xjgz-bj'}}).parsed
      end

      def email
        raw_info['email'] || (email_access_allowed? ? emails.first : nil)
      end

      def emails
        access_token.options[:mode] = :query
        @emails ||= access_token.get('/user/emails').parsed
      end

      def email_access_allowed?
        options['scope'] && !(options['scope'] == 'public')
      end

    end
  end
end

OmniAuth.config.add_camelization 'workxp', 'Workxp'
