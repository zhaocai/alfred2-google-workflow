# encoding: utf-8

require 'uri'
require 'net/http'
require "rexml/document"



class GoogleSuggest
  class Configure
    attr_accessor :home_language
    attr_accessor :proxy

    def initialize
      @home_language = 'en'
    end
  end

  attr_accessor :home_language
  attr_accessor :proxy

  @@configure = Configure.new

  class << self
    def configure
      yield @@configure if block_given?
      @@configure
    end

    def suggest_for(keyword)
      self.new.suggest_for(keyword)
    end
  end

  def initialize
    @home_language = @@configure.home_language
    @proxy = @@configure.proxy
  end

  def suggest_for(keyword)
    query = {:output => 'toolbar',
             :hl => self.home_language,
             :q => URI.encode(keyword)}
    res = http_get('/complete/search', query)

    doc = REXML::Document.new(res.body.to_s)

    suggestions = []
    doc.elements.each("toplevel/CompleteSuggestion/suggestion") { |elem |
      text = elem.attributes["data"]
      unless text.eql? query
        count = elem.attributes["num_queries"]
        suggestions << {:text => text,  :count => count}
      end
    }
    return suggestions
  end

  private
  GOOGLE_HOST = 'www.google.com'

  def http
    if @proxy
      proxy_url = URI.parse(@proxy) 
      http_class = Net::HTTP.Proxy(proxy_url.host, proxy_url.port)
    else
      http_class = Net::HTTP
    end
    http_class.new(GOOGLE_HOST)
  end

  def http_get(path, query) 
    path = path + '?' + query.map{|k,v| "#{k}=#{v}"}.join('&')
    req = Net::HTTP::Get.new(path)
    http.request(req)
  end

end
