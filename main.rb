require 'nokogiri'
require 'phantom_pain'

phantom_pain_factory = PhantomPainFactory.new('/etc/tor/cookie/control_auth_cookie', '127.0.0.1', '9050')
2.times do
  phantom_pain_factory.create do |web_driver|
    user_agent = web_driver.execute_script 'return navigator.userAgent'
    puts user_agent

    web_driver.navigate.to 'http://whatismyip.akamai.com'
    ip = Nokogiri::HTML(web_driver.page_source).xpath('/').text
    puts ip
  end
end
phantom_pain_factory.relieve

