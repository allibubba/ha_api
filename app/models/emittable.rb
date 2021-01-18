require 'active_support/concern'

module MyModule
  extend Emittable::Concern

  included do
    after_create :send_message_to_queue
  end

  def send_message_to_queue
  end

end
