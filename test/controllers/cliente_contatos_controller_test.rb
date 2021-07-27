require "test_helper"

class ClienteContatosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente_contato = cliente_contatos(:one)
  end

  test "should get index" do
    get cliente_contatos_url, as: :json
    assert_response :success
  end

  test "should create cliente_contato" do
    assert_difference('ClienteContato.count') do
      post cliente_contatos_url, params: { cliente_contato: { celular: @cliente_contato.celular, cliente_id: @cliente_contato.cliente_id, email: @cliente_contato.email, instagram: @cliente_contato.instagram } }, as: :json
    end

    assert_response 201
  end

  test "should show cliente_contato" do
    get cliente_contato_url(@cliente_contato), as: :json
    assert_response :success
  end

  test "should update cliente_contato" do
    patch cliente_contato_url(@cliente_contato), params: { cliente_contato: { celular: @cliente_contato.celular, cliente_id: @cliente_contato.cliente_id, email: @cliente_contato.email, instagram: @cliente_contato.instagram } }, as: :json
    assert_response 200
  end

  test "should destroy cliente_contato" do
    assert_difference('ClienteContato.count', -1) do
      delete cliente_contato_url(@cliente_contato), as: :json
    end

    assert_response 204
  end
end
