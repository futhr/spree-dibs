require 'net/http'

Net::HTTP.class_eval do
  def do_start
    # Start Hack
    @ssl_version = :SSLv3 if @address =~ /.*\.dibspayment\.com/
    # PREPARE', End Hack
    connect
    @started = true
  end
end
