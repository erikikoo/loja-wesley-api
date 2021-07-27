class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :update, :destroy]

  # GET /pedidos
  def index
    $_pedidos = Pedido.all
    @pedidos = checaPrazoDoPedido($_pedidos)
    render json: @pedidos, include: [:pedido_itens, :conversas]
  end

  # GET /pedidos/1
  def show
    
    @pedido.conversas.update(visualizado: true)

    render json: @pedido, include: [:pedido_itens, :conversas, :cliente => {:include => [:cliente_contato, :cliente_endereco]}]  end

  # POST /pedidos
  def create
    @pedido = Pedido.new(pedido_params)    

    $_cliente = Cliente.find(params[:cliente_id])    
    
    @pedido[:cliente_id] = $_cliente.id
    @pedido[:numero_pedido] = params[:numero_pedido]
    @pedido[:desconto] = params[:desconto]    
    @pedido[:forma_pagamento] = params[:forma_pagamento]    
    @pedido[:valor_venda] = params[:valor_venda]    

    if @pedido.save!
    
      params[:pedido_itens_attributes].each do |item|        
        produto = @pedido.pedido_itens.create(montaPedido(item))
        produto.save!
      end    
      render json: @pedido, status: :created, location: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pedidos/1
  def update
    if @pedido.update(pedido_params)
      render json: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pedidos/1
  def destroy
    @pedido.destroy
  end

  

  def recuperaUltimaOS
    $ultimaOS = Pedido.last()
   
    
      if $ultimaOS && !$ultimaOS.numero_pedido.nil?     
         @numero_de_servico = {os: montaOS($ultimaOS.numero_pedido)}
      else
        @numero_de_servico = {os: "00001"} 
      end
    render json: @numero_de_servico
  end

  def montaOS os
    return (Integer(os)+1).to_s.rjust(5,"0")
  end


  def checaPrazoDoPedido pedidos   
    
    $_pedidos = [] 

    pedidos.each do |pedido|    
    
      $_pedido_entrega = pedido[:data_entrega]
      
      unless pedido.nil? && $_pedido_entrega.nil?
        $_hoje = Date.today      
        $_prioridade
        
        if $_pedido_entrega > $_hoje+2.day
          $_prioridade = 1
          # puts "dentro do prazo" 
        elsif ($_pedido_entrega <= $_hoje+2.day && $_pedido_entrega >= $_hoje) || $_pedido_entrega == $_hoje
          $_prioridade = 2
          # puts "Urgente"
        else
          $_prioridade = 3
          # puts "Atrasado"
        end      
        
      end  
      pedido[:prioridade] = $_prioridade      
      $_pedidos.push(pedido)
    end
    return $_pedidos
  end

  

  private

  def montaPedido parametros
    {   
        produto: parametros[:produto], 
        tiragem: parametros[:tiragem],
        valor: parametros[:valor], 
        status: false, 
        descricao: parametros[:descricao]  
    }

  end
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:pedido_dados ,:numero_pedido, :data_entrega, :urgencia, :forma_pagamento, :valor_venda, :desconto, :vendendor, :cliente_id, :endereco_entrega, :numero_entrega, :retirar,
      pedido_itens_attributes: [:produto, :tiragem, :valor, :status, :descricao])
    end
end
