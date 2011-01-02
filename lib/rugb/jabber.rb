module Rugb
  module Jabber

    def self.included(base)
      base.extend ClassMethods
    end

    def self.notifications_enabled
      ENABLE_JABBER_NOTIFICATIONS
    rescue
      true
    end

    def jabber_client
      return @jabber_client if @jabber_client.present?
      @jabber_client = ::Jabber::Client.new(::Jabber::JID::new(JABBER_ID))
      @jabber_client.connect
      @jabber_client.auth JABBER_PASSWORD
      @jabber_client
    end

    def send_jabber_message(text)
      return unless Rugb::Jabber.notifications_enabled
      receivers = User.notified_by_jabber.map(&:email)
      receivers.each do |to|
        message = ::Jabber::Message.new(to, text)
        message.type = :chat
        jabber_client.send message
      end
    end

    module ClassMethods

      def notify(callback, text_method)
        method_name = "notify_jabber_users_#{callback}"
        define_method method_name do
          text = send(text_method)
          send_jabber_message(text)
        end
        send callback, method_name
      end

    end

  end # END Jabber
end # END Rugb
