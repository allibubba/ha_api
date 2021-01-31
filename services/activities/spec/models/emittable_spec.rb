require 'rails_helper'

RSpec.describe Emittable, type: :module do
  describe 'send_message_to_queue' do
    let(:dummy_class) { Class.new { extend Emittable } }
    let(:err) {'test message'}

    context 'success' do
      it 'returns a connection' do
        allow(MQTT_CLIENT).to receive(:connect) { :connected }
        expect(dummy_class.send_message_to_queue).to eq(:connected)
      end
    end

    context 'failure' do
      it 'loggs MQTT protocol exception message' do
        allow(MQTT_CLIENT).to receive(:connect) { raise MQTT::ProtocolException.new(err) }
        expect(Rails.logger).to receive(:error).with("MQTT failure: #{err}")
        dummy_class.send_message_to_queue
      end

      it 'logs the exception object' do
        allow(MQTT_CLIENT).to receive(:connect) { raise err }
        expect(Rails.logger).to receive(:error).with("failure to publish: #{err}")
        dummy_class.send_message_to_queue
      end
    end
  end
end
