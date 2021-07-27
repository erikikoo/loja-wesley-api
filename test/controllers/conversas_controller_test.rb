require "test_helper"

class ConversasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversa = conversas(:one)
  end

  test "should get index" do
    get conversas_url, as: :json
    assert_response :success
  end

  test "should create conversa" do
    assert_difference('Conversa.count') do
      post conversas_url, params: { conversa: { descricao: @conversa.descricao, pedido_id: @conversa.pedido_id } }, as: :json
    end

    assert_response 201
  end

  test "should show conversa" do
    get conversa_url(@conversa), as: :json
    assert_response :success
  end

  test "should update conversa" do
    patch conversa_url(@conversa), params: { conversa: { descricao: @conversa.descricao, pedido_id: @conversa.pedido_id } }, as: :json
    assert_response 200
  end

  test "should destroy conversa" do
    assert_difference('Conversa.count', -1) do
      delete conversa_url(@conversa), as: :json
    end

    assert_response 204
  end
end
