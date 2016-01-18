require 'rails_helper'

describe Contract do
  describe '#print_tools' do
    it 'no tools' do
      contract = build(:contract)
      expect(contract.print_tools).to eq ''
    end

    it 'two tools' do
      contract = build(:contract)
      contract.tools << build(:tool, name: 'Furadeira')
      contract.tools << build(:tool, name: 'Britadeira')
      expect(contract.print_tools).to eq 'Furadeira, Britadeira'
    end
  end
end
