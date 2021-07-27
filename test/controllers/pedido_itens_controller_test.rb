require "test_helper"

class PedidoItensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido_iten = pedido_itens(:one)
  end

  test "should get index" do
    get pedido_itens_url, as: :json
    assert_response :success
  end

  test "should create pedido_iten" do
    assert_difference('PedidoIten.count') do
      post pedido_itens_url, params: { pedido_iten: { descricao: @pedido_iten.descricao, pedido_id: @pedido_iten.pedido_id, produto_id: @pedido_iten.produto_id, quantidade: @pedido_iten.quantidade, status: @pedido_iten.status, valor: @pedido_iten.valor } }, as: :json
    end

    assert_response 201
  end

  test "should show pedido_iten" do
    get pedido_iten_url(@pedido_iten), as: :json
    assert_response :success
  end

  test "should update pedido_iten" do
    patch pedido_iten_url(@pedido_iten), params: { pedido_iten: { descricao: @pedido_iten.descricao, pedido_id: @pedido_iten.pedido_id, produto_id: @pedido_iten.produto_id, quantidade: @pedido_iten.quantidade, status: @pedido_iten.status, valor: @pedido_iten.valor } }, as: :json
    assert_response 200
  end

  test "should destroy pedido_iten" do
    assert_difference('PedidoIten.count', -1) do
      delete pedido_iten_url(@pedido_iten), as: :json
    end

    assert_response 204
  end
end
