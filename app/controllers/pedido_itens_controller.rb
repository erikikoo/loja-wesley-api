class PedidoItensController < ApplicationController
  before_action :set_pedido_iten, only: [:show, :update, :destroy]

  # GET /pedido_itens
  def index
    @pedido_itens = PedidoIten.all

    render json: @pedido_itens
  end

  # GET /pedido_itens/1
  def show
    render json: @pedido_iten
  end

  # POST /pedido_itens
  def create
    @pedido_iten = PedidoIten.new(pedido_iten_params)

    if @pedido_iten.save
      render json: @pedido_iten, status: :created, location: @pedido_iten
    else
      render json: @pedido_iten.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pedido_itens/1
  def update
    if @pedido_iten.update(pedido_iten_params)
      render json: @pedido_iten
    else
      render json: @pedido_iten.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pedido_itens/1
  def destroy
    @pedido_iten.destroy
  end

  def produzir
    
    
    params[:pedido_itens].each do |item|
      PedidoIten.find(item).update(produzir: true)  
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido_iten
      @pedido_iten = PedidoIten.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_iten_params
      params.require(:pedido_iten).permit(:quantidade, :valor, :status, :descricao, :pedido_id, :produto_id)
    end
end
