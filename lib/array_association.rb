# frozen_string_literal: true

require 'array_association/version'
require 'active_support/concern'

# Usage:
#
#   include ArrayAssociation
#   array_column :order_ids, :orders, { class: Order }
#
# in this case some methods will be defined:
#   orders, which returns collection of Order
#   order_ids=, which sets normalized order_ids
#   orders=(values), which maps collection and sets order_ids
#
module ArrayAssociation
  extend ActiveSupport::Concern

  autoload :Utils, 'array_association/utils'

  module ClassMethods
    def array_column(column, collection, options)
      define_method collection do
        options[:class].send(:where, id: send(column))
      end

      define_method "#{column}=" do |value|
        ids = Utils.normalize_integer_array(value)
        write_attribute(column, ids)
      end

      define_method "#{collection}=" do |values|
        ids = Array.wrap(values).map(&:id)
        send "#{column}=", ids
      end
    end
  end
end
