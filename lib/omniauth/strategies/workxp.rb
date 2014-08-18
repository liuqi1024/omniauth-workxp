require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class WorkXP < OmniAuth::Strategies::OAuth2
      option :name, 'workxp'
      
      option :client_options, {
        :site => 'https://workxp.info'
      }

      uid { raw_info['identity']['id'].to_s }

      info do
        {
          'email' => raw_info['identity']['email'],
          'name' => raw_info['identity']['name'],
          'image' => raw_info['avatar_url'],
          'accounts' => raw_info['accounts']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/api/authorization.json').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'workxp', 'WorkXP'
