require 'net/http'
require 'daemons'
require_relative 'mailer'

class Check
  def initialize(url)
    begin
      @status = true
      @uri = URI(url)
      @res = Net::HTTP.get_response(@uri)
      if @res.code != '200' && @status == true
        Mailer.new("code    - #{@res.code} \nmessage - #{@res.message}")
        @status == false
        puts "#{@uri}: code    - #{@res.code}, message - #{@res.message}"
      elsif @res.code != '200' && @status == false
        # doing nothing
        puts "#{@uri}: code    - #{@res.code}, message - #{@res.message}"
      else
        if @status == false
          Mailer.new("code    - #{@res.code} \nmessage - #{@res.message}")
          @status = true
        end
        puts "#{@uri}: code    - #{@res.code}, message - #{@res.message}"
      end
    rescue SocketError => e
      puts "====== INVALID URL ======"
      puts e
      puts "====== INVALID URL ======"
    end
  end
end