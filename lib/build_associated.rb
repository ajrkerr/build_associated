require "build_associated/version"

module BuildAssociated
  extend ActiveSupport::Concern

  module ClassMethods
    def auto_build_association association_name
      alias_method "_#{association_name}".to_sym, association_name
      remove_method association_name

      define_method association_name do
        self.send("_#{association_name}".to_sym) || self.send("build_#{association_name}").to_sym
      end
    end
  end
end

class ActiveRecord::Base
  include BuildAssociated
end
