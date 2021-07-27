class CreatePedidos < ActiveRecord::Migration[6.1]
  def change
    create_table :pedidos do |t|
      t.string :numero_pedido, limit: 6
      t.string :urgencia, limit: 1
      t.string :prioridade, limit: 1

      t.string :forma_pagamento, limit: 254
      t.decimal :valor_venda, :precision => 8, :scale => 2
      t.decimal :desconto, :precision => 8, :scale => 2
      t.string :vendedor
      t.string :endereco_entrega, limit: 254
      t.string :numero_entrega, limit: 254
      t.boolean :retirar   
      t.date :data_entrega
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
