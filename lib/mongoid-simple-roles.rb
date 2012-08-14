module Mongoid
  module Document
    module Roleable
      def self.included(base)
        base.class_eval do |klass|
          klass.field :roles, :type => Array
          klass.index({ roles: 1 }, { background: true })

          include InstanceMethods
          extend ClassMethods
        end
      end

      module InstanceMethods
        def with_roles=(roles)
          self.roles = roles if roles.is_a? Array
        end

        def add_role(role)
          self.roles ||= []
          self.roles << role if role
          self.roles.uniq!
        end

        def has_role?(role)
          self.roles.include?(role)
        end

        def remove_role(role)
          self.roles.delete_if { |r| r.casecmp(role) == 0 }
        end
      end

      module ClassMethods
        def find_roles(roles)
          roles = [roles] unless roles.is_a? Array
          criteria.in(:roles => roles).to_a
        end
      end
    end
  end
end