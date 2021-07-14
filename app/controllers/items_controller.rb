class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :verify_admin_role, except: %i[ show index ]

  # GET /items or /items.json
  def index
    @store = Store.where(id: params[:store_id]).first
    @items = @store&.items
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new(store_id: params[:store_id])
    @store = Store.where(id: params[:store_id]).first
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to store_item_path(id: @item.id, store_id: @item.store_id), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to store_item_path(id: @item.id, store_id: @item.store_id), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: store_item_path(id: @item.id, store_id: @item.store_id) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @pitem.destroy
    respond_to do |format|
      format.html { redirect_to store_items_path(store_id: @item.store_id), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      return @item if @item = Item.where(id: params[:id]).first

      redirect_to store_items_path(store_id: params[:store_id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :store_id, :category_id)
    end
end
