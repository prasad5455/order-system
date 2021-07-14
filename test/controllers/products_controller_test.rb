require "test_helper"

class itemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post items_url, params: { product: { description: @product.description, name: @product.name, price: @product.price, store_id: @product.store_id } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, name: @product.name, price: @product.price, store_id: @product.store_id } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to items_url
  end
end
