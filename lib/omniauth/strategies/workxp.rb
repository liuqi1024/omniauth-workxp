require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class WorkXP < OmniAuth::Strategies::OAuth2
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

      uid { raw_info['identity']['id'].to_s }

      info do
        {
          'email' => email,
          'name' => raw_info['identity']['name'],
          'image' => raw_info['avatar_url'],
          'accounts' => raw_info['accounts']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/api/authorization.json').parsed
      end

      def email
        raw_info['identity']['email']
      end
    end
  end
end

OmniAuth.config.add_camelization 'workxp', 'WorkXP'
