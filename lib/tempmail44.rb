#!/usr/bin/env ruby

# file: tempmail44.rb

# description: Uses the Temp Mail API to create a temporary email address

# notes: 
#   * You must sign up to Rapid API to use the service
#   * API usage is free for low usage
#   * Subscribe to the Temp Mail API from the Rapid API site

#   see https://rapidapi.com/calvinloveland335703-0p6BxLYIH8f/api/temp-mail44/

require 'uri'
require 'net/http'
require 'openssl'


class TempMail44

  attr_reader :email

  def initialize(host: 'temp-mail44.p.rapidapi.com', apikey: '', debug: false)

    @host, @apikey, @debug = host, apikey, debug

  end

  # create an email address
  # 
  def create()

    h = api('/api/v3/email/new', :post) do |request|

      request["content-type"] = 'application/json'
      request.body = "{\n    \"key1\": \"value\",\n    \"key2\": \"value\"\n}"

    end

    puts 'create() h: ' + h.inspect if @debug

    @email = h[:email]

  end

  # read the inbox
  #
  # message fields: id, from, to, cc, subject, body_text, body_html, 
  #                 created_at, attachments
  #
  def read()

    api("/api/v3/email/#{@email}/messages").map {|x| OpenStruct.new(x)}

  end

  private

  def api(uri, type=:get)

    url = URI('https://' + @host + uri)
    puts 'api() url: ' + url.inspect if @debug

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = type == :get ? Net::HTTP::Get.new(url) : Net::HTTP::Post.new(url)
    request["X-RapidAPI-Host"] = @host
    request["X-RapidAPI-Key"] = @apikey

    yield(request) if block_given?

    response = http.request(request)
    JSON.parse(response.read_body, symbolize_names: true)


  end

end
