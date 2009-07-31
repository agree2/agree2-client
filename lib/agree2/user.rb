AGREE2_JSON_HEADERS={'Content-Type'=>'application/json','Accept'=>'application/json'}
module Agree2
  class User
    attr_accessor :client,:access_token
    def initialize(client,key,secret)
      @client=client
      @access_token=OAuth::AccessToken.new @client.consumer,key,secret
    end
    
    def agreements
      @agreements||=Agree2::ProxyCollection.new self,'/agreements','Agreement'
    end
    
    def templates
      @templates||=Agree2::ProxyCollection.new self,'/masters','Template'
    end
    
    def get(path,options={})
      handle_response @access_token.get(path,{'Accept'=>'application/json'}.merge(options))
    end

    def head(path,options={})
      handle_response @access_token.head(path,options)
    end
    
    def post(path,data=nil,options={})
      handle_response @access_token.post(path,(data ? data.to_json : nil),AGREE2_JSON_HEADERS.merge(options))
    end
    
    def put(path,data=nil,options={})
      handle_response @access_token.put(path,(data ? data.to_json : nil),AGREE2_JSON_HEADERS.merge(options) )
    end
    
    def delete(path,options={})
      handle_response @access_token.delete(path,options)
    end

    # OAuth Stuff below here
    
    # The AccessToken token
    def token
      @access_token.token
    end
    
    # The AccessToken secret
    def secret
      @access_token.secret
    end
    
    def path #:nodoc:
      ""
    end
    protected
    
    def handle_response(response)#:nodoc:
      case response.code
      when "200"
        response.body
      when "201"
        response.body
      when "302"
        if response['Location']=~/(#{AGREE2_URL})\/(.*)$/
          parts=$2.split('/')
          (('Agree2::'+parts[0].classify).constantize).get self,parts[1]
        else
          #todo raise hell
        end
      else
        response
      end
    end
  end
end