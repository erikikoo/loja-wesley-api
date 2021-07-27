class CreateClienteContatos < ActiveRecord::Migration[6.1]
  def change
    create_table :cliente_contatos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :celular, limit: 14
      t.string :email, limit: 254
      t.string :instagram, limit: 254
      t.string :whatsapp

      t.timestamps
    end
  end
end
