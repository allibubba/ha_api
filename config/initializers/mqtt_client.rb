MQTT_CLIENT = MQTT::Client.new(
  :host => ENV['MQTT_HOST'],
  :port => 1883,
  :ssl => false,
  :version => '3.1.1',
  :username => ENV['MQTT_USER'],
  :password => ENV['MQTT_PASSWORD'],
  :keep_alive => 15,
  :ack_timeout => 15,
  :client_id => 'HomeAssistantApi'
) 

