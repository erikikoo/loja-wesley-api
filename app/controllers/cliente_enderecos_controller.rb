class ClienteEnderecosController < ApplicationController
  before_action :set_cliente_endereco, only: [:show, :update, :destroy]

  # GET /cliente_enderecos
  def index
    @cliente_enderecos = ClienteEndereco.all

    render json: @cliente_enderecos
  end

  # GET /cliente_enderecos/1
  def show
    render json: @cliente_endereco
  end

  # POST /cliente_enderecos
  def create
    @cliente_endereco = ClienteEndereco.new(cliente_endereco_params)

    if @cliente_endereco.save
      render json: @cliente_endereco, status: :created, location: @cliente_endereco
    else
      render json: @cliente_endereco.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cliente_enderecos/1
  def update
    if @cliente_endereco.update(cliente_endereco_params)
      render json: @cliente_endereco
    else
      render json: @cliente_endereco.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cliente_enderecos/1
  def destroy
    @cliente_endereco.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente_endereco
      @cliente_endereco = ClienteEndereco.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_endereco_params
      params.require(:cliente_endereco).permit(:cliente_id, :endereco, :numero, :cidade, :estado, :cep)
    end
end
