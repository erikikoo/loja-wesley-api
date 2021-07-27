class CreateProdutos < ActiveRecord::Migration[6.1]
  def change
    create_table :produtos do |t|
      t.string :descricao, limit:254
      t.timestamps
    end
  end
end
