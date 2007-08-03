require 'net/http'
require 'facebooker/parser'
module Facebooker
  class Service
    def initialize(api_base, api_path, api_key)
      @api_base = api_base
      @api_path = api_path
      @api_key = api_key
    end
    
    def post(params)
      Parser.parse(params[:method], Net::HTTP.post_form(url, params))
    end
    
    private
      def url
        URI.parse('http://'+ @api_base + @api_path)      
      end
  end
end