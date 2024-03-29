require "build_associated/version"

module BuildAssociated
  extend ActiveSupport::Concern

  module ClassMethods
    def build_associated association_name
      begin 
        alias_method "_#{association_name}", association_name
        remove_method(association_name)

        define_method association_name do
          obj = self.send("_#{association_name}") || super
          obj ||= self.send("build_#{association_name}") unless self.frozen? or self.readonly?
          return obj
        end
      rescue NameError
        define_method association_name do
          obj = super
          obj ||= self.send("build_#{association_name}") unless self.frozen? or self.readonly?
          return obj
        end
      end
    end
  end
end

class ActiveRecord::Base
  include BuildAssociated
end
