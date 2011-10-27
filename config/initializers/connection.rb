class ActiveResource::Connection
 # Creates new Net::HTTP instance for communication with
 # remote service and resources.
 def http
   http = Net::HTTP.new(@site.host, @site.port)
   http.use_ssl = @site.is_a?(URI::HTTPS)
   http.verify_mode = OpenSSL::SSL::VERIFY_NONE if @site.is_a?(URI::HTTPS)
   http.read_timeout = @timeout if @timeout
   #Here's the addition that allows you to see the output
   http.set_debug_output $stderr
   return http
 end
end