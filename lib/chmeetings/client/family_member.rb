module Chmeetings
  class Client
    module FamilyMember
      def list_family_members(**options)
        get('family-members', options)
      end

      def create_family_member(**data)
        post('family-members', data)
      end

      def update_family_member(**data)
        put('family-members', data)
      end

      def patch_family_member(**data)
        patch('family-members', data)
      end

      def delete_family_member(**data)
        post('family-members/delete', data)
      end
    end
  end
end
