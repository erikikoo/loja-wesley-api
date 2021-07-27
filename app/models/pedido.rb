class Pedido < ApplicationRecord
  enum entrega: [:nao, :sim]
  # enum forma_pagamento: [:dinheiro, :cartao]
  belongs_to :cliente

  has_many :conversas

  has_many :pedido_itens, dependent: :destroy
  accepts_nested_attributes_for :pedido_itens
end
