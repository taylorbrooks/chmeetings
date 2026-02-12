module Chmeetings
  class Client
    module Batch
      def list_batches(**options)
        get('contributions/batches', options)
      end

      def create_batch(**data)
        post('contributions/batches', data)
      end

      def get_batch(id:)
        get("contributions/batches/#{id}")
      end

      def update_batch(id:, **data)
        put("contributions/batches/#{id}", data)
      end

      def delete_batch(id:)
        delete("contributions/batches/#{id}")
      end
    end
  end
end
