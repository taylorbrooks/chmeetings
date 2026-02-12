module Chmeetings
  class Client
    module Person
      def list_people(**options)
        get('people', options)
      end

      def create_person(**data)
        post('people', data)
      end

      def update_person(**data)
        put('people', data)
      end

      def delete_person(**data)
        post('people/delete', data)
      end
    end
  end
end
