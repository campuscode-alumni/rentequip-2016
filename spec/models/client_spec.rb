require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'has a custom to_s' do
    client = create(:client)

    expect(client.to_s).to eq('Fantasy Code SP')
  end
end
