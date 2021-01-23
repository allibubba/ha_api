require 'active_support/concern'

module Emittable
  extend ActiveSupport::Concern

  included do
    after_save :send_message_to_queue
  end

  def send_message_to_queue
    begin
      MQTT_CLIENT.connect() do |c|
        c.publish(self.topic, "49")
      end
    rescue MQTT::ProtocolException => error
      Rails.logger.error "MQTT failure: " + error.message
    end
  end
end
