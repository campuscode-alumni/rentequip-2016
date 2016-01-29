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
      expect(contract.errors).to include :term
    end
  end

  describe 'contract number validation' do
    it 'successfully' do
      contract = build(:contract)
      contract.tools << build(:tool, name: 'Furadeira')
      contract.valid?
      expect(contract.contract_number).to_not be_nil
    end

    it 'successfully create contract_number' do
      contract = build(:contract)
      contract.tools << build(:tool, name: 'Furadeira')
      contract.valid?
      expect(contract.contract_number).to eq "#{Time.zone.now.year}000001"
    end
  end

  describe 'contract price by term and tool validation' do
    it 'successfully' do
      contract = build(:contract)
      tool = create(:tool, name: 'Furadeira')
      # TODO: trocar deadline por term
      create(:price, tools_group: tool.tools_group, deadline: contract.term,
                     price: 15)
      contract.tools << tool
      contract.save
      expect(contract.total_price).to eq 15
    end

    it 'successfully set 0 for a term without a price' do
      contract = build(:contract, term: 3)
      contract.tools << build(:tool, name: 'Furadeira')
      contract.save
      expect(contract.total_price).to eq 0
    end
  end
end
