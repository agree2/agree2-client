require 'net/https'
require 'rubygems'
gem 'oauth', ">= 0.3.5"
require 'oauth'
gem 'json'
gem 'activesupport'
require 'activesupport'
AGREE2_ENV = :production unless defined?(AGREE2_ENV)
AGREE2_URL = (AGREE2_ENV==:development) ? 'http://agree2.dev' : 'https://agree2.com'
module Agree2
  class Agree2Exception < RuntimeError #:nodoc:
  end
end
require 'agree2/client'
require 'agree2/proxy_collection'
require 'agree2/user'
require 'agree2/base'
require 'agree2/agreement'
require 'agree2/party'
require 'agree2/template'


if OAuth::VERSION=='0.3.5'
  unless OAuth::Consumer.method_defined? :create_http_with_ca_file_option
    class OAuth::Consumer
      alias_method :create_http_without_ca_file_option, :create_http
      # monkey patch with ca_file option from 0.3.6 to allow us to set the agree2 certs
      def create_http_with_ca_file_option(_url = nil)
        http_object = create_http_without_ca_file_option(_url)
        if http_object.use_ssl && @options[:ca_file]
          http_object.ca_file = @options[:ca_file]
          http_object.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http_object.verify_depth = 5
        end
                
        http_object
      end
      alias_method :create_http, :create_http_with_ca_file_option
    end
  end
end