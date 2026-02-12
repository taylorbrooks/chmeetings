module Chmeetings
  class Client
    module Family
      def list_families(**options)
        get('families', options)
      end

      def create_family(**data)
        post('families', data)
      end

      def get_family(**options)
        get('families/show', options)
      end

      def update_family(**data)
        put('families', data)
      end

      def delete_family(**data)
        post('families/delete', data)
      end
    end
  end
end
