class User < ActiveRecord::Base
  include ArrayAssociation

  array_column :order_ids, :orders, class: Order

  store :settings, accessors: [:order_ids], coder: JSON
end
