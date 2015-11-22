require 'test_helper'

class DirectTreasuriesControllerTest < ActionController::TestCase
  setup do
    @direct_treasury = direct_treasuries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:direct_treasuries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create direct_treasury" do
    assert_difference('DirectTreasury.count') do
      post :create, direct_treasury: { acquisitionsTax: @direct_treasury.acquisitionsTax, admTax: @direct_treasury.admTax, buyDate: @direct_treasury.buyDate, dueDate: @direct_treasury.dueDate, investment_value: @direct_treasury.investment_value, title: @direct_treasury.title, wallet_id: @direct_treasury.wallet_id }
    end

    assert_redirected_to direct_treasury_path(assigns(:direct_treasury))
  end

  test "should show direct_treasury" do
    get :show, id: @direct_treasury
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @direct_treasury
    assert_response :success
  end

  test "should update direct_treasury" do
    patch :update, id: @direct_treasury, direct_treasury: { acquisitionsTax: @direct_treasury.acquisitionsTax, admTax: @direct_treasury.admTax, buyDate: @direct_treasury.buyDate, dueDate: @direct_treasury.dueDate, investment_value: @direct_treasury.investment_value, title: @direct_treasury.title, wallet_id: @direct_treasury.wallet_id }
    assert_redirected_to direct_treasury_path(assigns(:direct_treasury))
  end

  test "should destroy direct_treasury" do
    assert_difference('DirectTreasury.count', -1) do
      delete :destroy, id: @direct_treasury
    end

    assert_redirected_to direct_treasuries_path
  end
end
