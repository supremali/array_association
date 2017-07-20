require 'spec_helper'

RSpec.describe ArrayAssociation do
  before(:each) do
    2.times { Order.create }
  end

  let(:user) { User.create(name: 'test_user', settings: { order_ids: [1, 2, 3] }) }
  let(:order_ids) { Order.all.pluck(:id) }

  it 'has a version number' do
    expect(ArrayAssociation::VERSION).not_to be nil
  end

  it 'should define collection reader method' do
    re = %w(select from orders where id in[\(\)\d\,\s]+).join('[\w\W]+')
    expect(user.orders.to_sql).to match(Regexp.new(re, Regexp::IGNORECASE))
  end

  it 'should define collection writer method' do
    expect(user).to receive(:write_attribute).with(:order_ids, order_ids).and_return(order_ids)

    user.orders = Order.all
  end
end
