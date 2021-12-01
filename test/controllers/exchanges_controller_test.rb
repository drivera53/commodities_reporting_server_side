require "test_helper"

class ExchangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchange = exchanges(:one)
  end

  test "should get index" do
    get exchanges_url, as: :json
    assert_response :success
  end

  test "should create exchange" do
    assert_difference('Exchange.count') do
      post exchanges_url, params: { exchange: { name: @exchange.name } }, as: :json
    end

    assert_response 201
  end

  test "should show exchange" do
    get exchange_url(@exchange), as: :json
    assert_response :success
  end

  test "should update exchange" do
    patch exchange_url(@exchange), params: { exchange: { name: @exchange.name } }, as: :json
    assert_response 200
  end

  test "should destroy exchange" do
    assert_difference('Exchange.count', -1) do
      delete exchange_url(@exchange), as: :json
    end

    assert_response 204
  end
end
