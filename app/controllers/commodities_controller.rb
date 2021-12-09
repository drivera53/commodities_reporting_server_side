class CommoditiesController < ApplicationController
  before_action :set_commodity, only: [:show, :update, :destroy]

  # GET /commodities
  def index
    @commodities = Commodity.all

    render json: @commodities
  end

  # GET /commodities/1
  def show
    render json: @commodity
  end

  # POST /commodities
  def create
    @commodity = Commodity.new(commodity_params)

    if @commodity.save
      exchanges = Exchange.all
      exchanges_json = exchanges.to_json(:include => [
        :commodities, :currencies])
      # render json: @exchange, status: :created, location: @exchange
      render json: {
        exchanges: exchanges_json
      }
    else
      render json: @commodity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /commodities/1
  def update
    if @commodity.update(commodity_params)
      render json: @commodity
    else
      render json: @commodity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /commodities/1
  def destroy
    @commodity.destroy
  end

  def special_destroy
    # print(exchange_params[:name])
    # print(exchange_params[:id])
    # print(exchange_params)
    # exchange = Exchange.find(params[:id])
    commodity = Commodity.find(commodity_params[:id]) 
    if commodity.destroy
      # All commodities
      commodities = Commodity.all
      commodities_json = commodities.to_json(:include => [
        :name, :unit, :price, :exchange_id, :created_at, :exchange])
      render json: {
        commodities: commodities_json
      }
    else
      render json: {error: "Error deleting Commodity!"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commodity
      @commodity = Commodity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commodity_params
      params.require(:commodity).permit(:name, :unit, :price, :exchange_id, :id)
    end
end
