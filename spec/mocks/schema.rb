ActiveRecord::Schema.define do
  create_table 'orders', force: true do |t|
  end

  create_table 'users', force: true do |t|
    t.string :name, limit: 64
    t.text :settings
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
  end
end
