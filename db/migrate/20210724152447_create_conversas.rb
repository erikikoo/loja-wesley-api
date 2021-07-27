class CreateConversas < ActiveRecord::Migration[6.1]
  def change
    create_table :conversas do |t|
      t.string :descricao
      t.boolean :visualizado, default: false
      t.references :pedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end
