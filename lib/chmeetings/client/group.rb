module Chmeetings
  class Client
    module Group
      def list_groups(**options)
        get('groups', options)
      end
    end
  end
end
