class ClienteContatosController < ApplicationController
  before_action :set_cliente_contato, only: [:show, :update, :destroy]

  # GET /cliente_contatos
  def index
    @cliente_contatos = ClienteContato.all

    render json: @cliente_contatos
  end

  # GET /cliente_contatos/1
  def show
    render json: @cliente_contato
  end

  # POST /cliente_contatos
  def create
    @cliente_contato = ClienteContato.new(cliente_contato_params)

    if @cliente_contato.save
      render json: @cliente_contato, status: :created, location: @cliente_contato
    else
      render json: @cliente_contato.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cliente_contatos/1
  def update
    if @cliente_contato.update(cliente_contato_params)
      render json: @cliente_contato
    else
      render json: @cliente_contato.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cliente_contatos/1
  def destroy
    @cliente_contato.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente_contato
      @cliente_contato = ClienteContato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_contato_params
      params.require(:cliente_contato).permit(:cliente_id, :celular, :email, :instagram)
    end
end
