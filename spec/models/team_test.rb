require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { described_class.new }

  it 'is not valid without name' do
    expect(subject).to_not be_valid
  end
end