# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_24_152447) do

  create_table "cliente_contatos", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.string "celular", limit: 14
    t.string "email", limit: 254
    t.string "instagram", limit: 254
    t.string "whatsapp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_cliente_contatos_on_cliente_id"
  end

  create_table "cliente_enderecos", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.string "endereco", limit: 254
    t.string "numero", limit: 6
    t.string "cidade", limit: 254
    t.string "bairro", limit: 254
    t.string "estado", limit: 254
    t.string "cep", limit: 12
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_cliente_enderecos_on_cliente_id"
  end

  create_table "clientes", charset: "utf8mb4", force: :cascade do |t|
    t.string "nome", limit: 254
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversas", charset: "utf8mb4", force: :cascade do |t|
    t.string "descricao"
    t.boolean "visualizado", default: false
    t.bigint "pedido_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedido_id"], name: "index_conversas_on_pedido_id"
  end

  create_table "pedido_itens", charset: "utf8mb4", force: :cascade do |t|
    t.string "produto", limit: 254
    t.string "tiragem", limit: 9
    t.decimal "valor", precision: 8, scale: 2
    t.string "status", limit: 1
    t.string "descricao", limit: 254
    t.boolean "produzir", default: false
    t.bigint "pedido_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedido_id"], name: "index_pedido_itens_on_pedido_id"
  end

  create_table "pedidos", charset: "utf8mb4", force: :cascade do |t|
    t.string "numero_pedido", limit: 6
    t.string "urgencia", limit: 1
    t.string "prioridade", limit: 1
    t.string "forma_pagamento", limit: 254
    t.decimal "valor_venda", precision: 8, scale: 2
    t.decimal "desconto", precision: 8, scale: 2
    t.string "vendedor"
    t.string "endereco_entrega", limit: 254
    t.string "numero_entrega", limit: 254
    t.boolean "retirar"
    t.date "data_entrega"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "produtos", charset: "utf8mb4", force: :cascade do |t|
    t.string "descricao", limit: 254
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cliente_contatos", "clientes"
  add_foreign_key "cliente_enderecos", "clientes"
  add_foreign_key "conversas", "pedidos"
  add_foreign_key "pedido_itens", "pedidos"
  add_foreign_key "pedidos", "clientes"
end
