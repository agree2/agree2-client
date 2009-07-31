module Agree2
  class Party<Base
    attr_serializable :id,:role,:email,:first_name,:last_name,:created_at,:updated_at,:organization_name,:status
    attr_read_only :id,:status,:created_at,:updated_at
    
    alias_method :agreement,:container  
    
    # Creates a one time signed url to redirect your user to their acceptance page. This url is only valid once. Call again to
    # redirect your user to the agreement again.
    def present
      path="/present/#{agreement.permalink}/to/#{email}"
      AGREE2_URL+user.client.consumer.create_signed_request(:get,path,user.access_token,{:scheme=>:query_string}).path
    end
    
    # Status of party
    # new|invited|accepted|declined
    def status
      @status||=load_state
    end
    
    
    def self.validate_parties_hash(parties)  #:nodoc:
      parties&&parties.each{|r,p| validate_party_hash(p)}
      true
    end
    
    def self.validate_party_hash(p)  #:nodoc:
      raise ArgumentError,"Your parties are missing required fields" if [:first_name,:last_name,:email].find{|k| !p.include?(k)}
      return true
    end
  end
end