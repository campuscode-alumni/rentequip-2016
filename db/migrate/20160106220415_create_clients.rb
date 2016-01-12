class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :cnpj
      t.string :contact_name
      t.string :phone
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
