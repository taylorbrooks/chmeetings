module Chmeetings
  class Client
    module Campaign
      def list_campaigns(**options)
        get('campaigns', options)
      end
    end
  end
end
