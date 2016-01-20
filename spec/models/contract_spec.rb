require 'rails_helper'

describe Contract do
  describe '#print_tools' do
    it 'no tools' do
      contract = build(:contract)
      expect(contract.print_tools).to eq ''
    end

    it 'one tool' do
      contract = build(:contract)
      contract.tools << build(:tool, name: 'Furadeira')
      expect(contract.print_tools).to eq 'Furadeira'
    end

    it 'two tools' do
      contract = build(:contract)
      contract.tools << build(:tool, name: 'Furadeira')
      contract.tools << build(:tool, name: 'Britadeira')
      expect(contract.print_tools).to eq 'Furadeira, Britadeira'
    end

    it 'five tools' do
      contract = build(:contract)
      contract.tools << build(:tool, name: 'Furadeira')
      contract.tools << build(:tool, name: 'Britadeira')
      contract.tools << build(:tool, name: 'Betoneira')
      contract.tools << build(:tool, name: 'Marteladeira')
      contract.tools << build(:tool, name: 'Andaime')
      expect(contract.print_tools)
        .to eq 'Furadeira, Britadeira, Betoneira, Marteladeira, Andaime'
    end
  end

  describe 'term validation' do
    it 'successfully' do
      contract = build(:contract, term: 7)
      contract.tools << build(:tool, name: 'Furadeira')
      expect(contract).to be_valid
    end

    it 'unsuccessfully' do
      contract = build(:contract, term: 5)
      contract.tools << build(:tool, name: 'Furadeira')
      expect(contract).to_not be_valid
    end
  end
end
