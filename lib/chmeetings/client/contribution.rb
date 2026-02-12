module Chmeetings
  class Client
    module Contribution
      def list_contributions(**options)
        get('contributions', options)
      end

      def create_contribution(**data)
        post('contributions', data)
      end
    end
  end
end
