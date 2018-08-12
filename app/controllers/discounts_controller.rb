class DiscountsController < ApiController
  before_action :set_discount, only: [:show, :update, :destroy]

  # GET /discounts
  # GET /discounts.json
  def index
    @discounts = Discount.all
  end

  # GET /discounts/1
  # GET /discounts/1.json
  def show
  end

  # POST /discounts
  # POST /discounts.json
  def create
    @discount = Discount.new(discount_params)

    if @discount.save
      render :show, status: :created
    else
      render json: @discount.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /discounts/1
  # PATCH/PUT /discounts/1.json
  def update
    if @discount.update(discount_params)
      render :show, status: :ok
    else
      render json: @discount.errors, status: :unprocessable_entity
    end
  end

  # DELETE /discounts/1
  # DELETE /discounts/1.json
  def destroy
    @discount.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_params
      params.fetch(:discount, {})
    end
end
