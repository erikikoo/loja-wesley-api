class CreatePedidoItens < ActiveRecord::Migration[6.1]
  def change
    create_table :pedido_itens do |t|
      t.string :produto , limit: 254
      t.string :tiragem, limit: 9
      t.decimal :valor, :precision => 8, :scale => 2
      t.string :status, limit: 1
      t.string :descricao, limit: 254
      t.boolean :produzir, default: false          
      t.references :pedido, null: false, foreign_key: true
      # t.references :produto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
