class Cliente < ApplicationRecord
    has_one :cliente_contato, dependent: :destroy
    has_one :cliente_endereco, dependent: :destroy
    has_many :pedidos

    accepts_nested_attributes_for :cliente_contato, :cliente_endereco #, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
    accepts_nested_attributes_for :pedidos #, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
