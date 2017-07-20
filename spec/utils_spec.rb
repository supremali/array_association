require 'spec_helper'

RSpec.describe ArrayAssociation::Utils do
  it 'should normalize value' do
    expect(described_class.normalize_integer_array('1')).to eq [1]
    expect(described_class.normalize_integer_array(['', 1, '3', '1'])).to eq [1, 3]
    expect(described_class.normalize_integer_array(['', 1, '3', 2])).to eq [1, 2, 3]
  end
end
