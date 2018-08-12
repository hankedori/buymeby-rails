class Sellmeby::ItemsController < ApiController
  before_action :authenticate_vendor!
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @vendor = current_vendor.items.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # POST /items
  # POST /items.json
  def create
    @item = current_vendor.items.new(item_params)

    if @item.save
      render :show, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      render :show, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.permit(:name, :description, :unit, :price, :quantity, :image)
    end

    def discount_params
      params.require(:item).permit(:discount).permit(:ratio)
    end
end
