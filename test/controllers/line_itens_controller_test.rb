require "test_helper"

class LineItensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_iten = line_itens(:one)
  end

  test "should get index" do
    get line_itens_url
    assert_response :success
  end

  test "should get new" do
    get new_line_iten_url
    assert_response :success
  end

  test "should create line_iten" do
    assert_difference("LineIten.count") do
      post line_itens_url, params: { line_iten: { cart_id: @line_iten.cart_id, product_id: @line_iten.product_id } }
    end

    assert_redirected_to line_iten_url(LineIten.last)
  end

  test "should show line_iten" do
    get line_iten_url(@line_iten)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_iten_url(@line_iten)
    assert_response :success
  end

  test "should update line_iten" do
    patch line_iten_url(@line_iten), params: { line_iten: { cart_id: @line_iten.cart_id, product_id: @line_iten.product_id } }
    assert_redirected_to line_iten_url(@line_iten)
  end

  test "should destroy line_iten" do
    assert_difference("LineIten.count", -1) do
      delete line_iten_url(@line_iten)
    end

    assert_redirected_to line_itens_url
  end
end
