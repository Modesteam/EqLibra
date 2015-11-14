require 'test_helper'

class ExchangesControllerTest < ActionController::TestCase
  setup do
    @exchange = exchanges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exchanges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exchange" do
    assert_difference('Exchange.count') do
      post :create, exchange: { buy_date: @exchange.buy_date, current_income: @exchange.current_income, discount: @exchange.discount, dollar_quotation: @exchange.dollar_quotation, efficiency: @exchange.efficiency, euro_quotation: @exchange.euro_quotation, exchange_type: @exchange.exchange_type, initial_dollar_quotation: @exchange.initial_dollar_quotation, initial_euro_quotation: @exchange.initial_euro_quotation, initial_income: @exchange.initial_income, name: @exchange.name, variation_dollar: @exchange.variation_dollar, variation_euro: @exchange.variation_euro, wallet_id: @exchange.wallet_id }
    end

    assert_redirected_to exchange_path(assigns(:exchange))
  end

  test "should show exchange" do
    get :show, id: @exchange
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exchange
    assert_response :success
  end

  test "should update exchange" do
    patch :update, id: @exchange, exchange: { buy_date: @exchange.buy_date, current_income: @exchange.current_income, discount: @exchange.discount, dollar_quotation: @exchange.dollar_quotation, efficiency: @exchange.efficiency, euro_quotation: @exchange.euro_quotation, exchange_type: @exchange.exchange_type, initial_dollar_quotation: @exchange.initial_dollar_quotation, initial_euro_quotation: @exchange.initial_euro_quotation, initial_income: @exchange.initial_income, name: @exchange.name, variation_dollar: @exchange.variation_dollar, variation_euro: @exchange.variation_euro, wallet_id: @exchange.wallet_id }
    assert_redirected_to exchange_path(assigns(:exchange))
  end

  test "should destroy exchange" do
    assert_difference('Exchange.count', -1) do
      delete :destroy, id: @exchange
    end

    assert_redirected_to exchanges_path
  end
end
