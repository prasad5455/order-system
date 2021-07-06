class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :verify_admin_role, except: %i[ show index ]

  # GET /products or /products.json
  def index
    @store = Store.where(id: params[:store_id]).first
    @products = @store&.products
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new(store_id: params[:store_id])
    @store = Store.where(id: params[:store_id]).first
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to new_store_product_path(@product.store_id), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to store_product_path(id: @product.id, store_id: @product.store_id), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: store_product_path(id: @product.id, store_id: @product.store_id) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to store_products_path(store_id: @product.store_id), notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      return @product if @product = Product.where(id: params[:id]).first

      redirect_to store_products_path(store_id: params[:store_id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :store_id)
    end
end
