class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :razao_social
      t.string :cnpj
      t.string :nome_contato
      t.string :telefone
      t.string :email
      t.string :logradouro
      t.integer :numero
      t.string :complemento
      t.string :cep
      t.string :bairro
      t.string :cidade
      t.string :uf

      t.timestamps null: false
    end
  end
end
