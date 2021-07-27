class CreateClienteEnderecos < ActiveRecord::Migration[6.1]
  def change
    create_table :cliente_enderecos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :endereco, limit: 254
      t.string :numero, limit: 6
      t.string :cidade, limit: 254
      t.string :bairro, limit: 254
      t.string :estado, limit: 254
      t.string :cep, limit: 12

      t.timestamps
    end
  end
end
