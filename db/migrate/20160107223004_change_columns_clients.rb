class ChangeColumnsClients < ActiveRecord::Migration
  def change
    rename_column :clients, :company_name, :company_name
    rename_column :clients, :contact_name, :contact_name
    rename_column :clients, :phone, :phone
    rename_column :clients, :logradouro, :address
    rename_column :clients, :numero, :address_number
    rename_column :clients, :complemento, :aditional_address_detail
    rename_column :clients, :cep, :zipcode
    rename_column :clients, :bairro, :neighborhood
    rename_column :clients, :cidade, :city
    rename_column :clients, :uf, :state
  end
end
