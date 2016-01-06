FactoryGirl.define do
  factory :client do
    razao_social "Campus Code"
    cnpj "26.286.134/0001-04"
    logradouro "Alameda Santos"
    numero "1293"
    complemento "conj 73"
    cep "12345-789"
    bairro "Cerqueira Cesar"
    cidade "São Paulo"
    uf "SP"
    nome_contato "Gustavo"
    telefone "555-555"
    email "g@code.com"
  end
end
