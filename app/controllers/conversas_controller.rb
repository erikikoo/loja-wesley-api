class ConversasController < ApplicationController
  before_action :set_conversa, only: [:show, :update, :destroy]

  # GET /conversas
  def index
    @conversas = Conversa.order(created_at: :desc)

    render json: @conversas
  end

  # GET /conversas/1
  def show
    render json: @conversa
  end

  # POST /conversas
  def create
    @conversa = Conversa.new(conversa_params)

    $_pedido = Pedido.find(params[:pedido_id])

    $_conversa = $_pedido.conversas.create(descricao: params[:descricao])
    

    if $_conversa.save
      # redirect_to pedidos_url and return
      render json: @pedidos, status: :created
    else
      render json: $_conversa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversas/1
  def update
    if @conversa.update(conversa_params)
      render json: @conversa
    else
      render json: @conversa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversas/1
  def destroy
    @conversa.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversa
      @conversa = Conversa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversa_params
      params.require(:conversa).permit(:descricao, :pedido_id)
    end
end
