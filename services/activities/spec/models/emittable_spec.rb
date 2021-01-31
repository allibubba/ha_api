require 'rails_helper'

RSpec.describe Emittable, type: :module do
  describe 'send_message_to_queue' do
    let(:dummy_class) { Class.new { extend Emittable } }

    context 'success' do
      it 'returns a connection' do
        allow(MQTT_CLIENT).to receive(:connect) { :connected }
        expect(dummy_class.send_message_to_queue).to eq(:connected)
      end
    end
  end
end
