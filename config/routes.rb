Rails.application.routes.draw do
  
      get 'pedidos/getLastOS', to: 'pedidos#recuperaUltimaOS'
      put 'pedidos/produzir', to: "pedido_itens#produzir"
      resources :conversas
      resources :pedidos
      resources :pedido_itens
      resources :produtos
      # resources :cliente_contatos
      # resources :cliente_enderecos
      resources :clientes
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
