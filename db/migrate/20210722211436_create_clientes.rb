class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :nome, limit: 254

      t.timestamps
    end
  end
end
