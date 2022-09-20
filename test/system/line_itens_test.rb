require "application_system_test_case"

class LineItensTest < ApplicationSystemTestCase
  setup do
    @line_iten = line_itens(:one)
  end

  test "visiting the index" do
    visit line_itens_url
    assert_selector "h1", text: "Line itens"
  end

  test "should create line iten" do
    visit line_itens_url
    click_on "New line iten"

    fill_in "Cart", with: @line_iten.cart_id
    fill_in "Product", with: @line_iten.product_id
    click_on "Create Line iten"

    assert_text "Line iten was successfully created"
    click_on "Back"
  end

  test "should update Line iten" do
    visit line_iten_url(@line_iten)
    click_on "Edit this line iten", match: :first

    fill_in "Cart", with: @line_iten.cart_id
    fill_in "Product", with: @line_iten.product_id
    click_on "Update Line iten"

    assert_text "Line iten was successfully updated"
    click_on "Back"
  end

  test "should destroy Line iten" do
    visit line_iten_url(@line_iten)
    click_on "Destroy this line iten", match: :first

    assert_text "Line iten was successfully destroyed"
  end
end
