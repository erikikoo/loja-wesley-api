require "test_helper"

class ClienteEnderecosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente_endereco = cliente_enderecos(:one)
  end

  test "should get index" do
    get cliente_enderecos_url, as: :json
    assert_response :success
  end

  test "should create cliente_endereco" do
    assert_difference('ClienteEndereco.count') do
      post cliente_enderecos_url, params: { cliente_endereco: { cep: @cliente_endereco.cep, cidade: @cliente_endereco.cidade, cliente_id: @cliente_endereco.cliente_id, endereco: @cliente_endereco.endereco, estado: @cliente_endereco.estado, numero: @cliente_endereco.numero } }, as: :json
    end

    assert_response 201
  end

  test "should show cliente_endereco" do
    get cliente_endereco_url(@cliente_endereco), as: :json
    assert_response :success
  end

  test "should update cliente_endereco" do
    patch cliente_endereco_url(@cliente_endereco), params: { cliente_endereco: { cep: @cliente_endereco.cep, cidade: @cliente_endereco.cidade, cliente_id: @cliente_endereco.cliente_id, endereco: @cliente_endereco.endereco, estado: @cliente_endereco.estado, numero: @cliente_endereco.numero } }, as: :json
    assert_response 200
  end

  test "should destroy cliente_endereco" do
    assert_difference('ClienteEndereco.count', -1) do
      delete cliente_endereco_url(@cliente_endereco), as: :json
    end

    assert_response 204
  end
end
