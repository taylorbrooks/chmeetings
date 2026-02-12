module Chmeetings
  class Client
    module Pledge
      def list_pledges(**options)
        get('pledges', options)
      end
    end
  end
end
