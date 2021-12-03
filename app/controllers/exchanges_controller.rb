class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show, :update, :destroy]

  # GET /exchanges
  def index
    @exchanges = Exchange.all

    render json: @exchanges
  end

  # GET /exchanges/1
  def show
    render json: @exchange
  end

  # POST /exchanges
  def create
    @exchange = Exchange.new(exchange_params)
    if @exchange.save
      exchanges = Exchange.all
      exchanges_json = exchanges.to_json(:include => [
        :commodities, :currencies])
      # render json: @exchange, status: :created, location: @exchange
      render json: {
        exchanges: exchanges_json
      }
    else
      render json: @exchange.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exchanges/1
  def update
    if @exchange.update(exchange_params)
      render json: @exchange
    else
      render json: @exchange.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exchanges/1
  def destroy
    @exchange.destroy
  end

  def special_destroy
    # print(exchange_params[:name])
    # print(exchange_params[:id])
    # print(exchange_params)
    # exchange = Exchange.find(params[:id])
    exchange = Exchange.find(exchange_params[:id]) 
    # Iterate over each commodity
    exchange.commodities.each do |commodity|
      commodity.destroy
    end
    # Iterate over each currency
    exchange.currencies.each do |currency|
      currency.destroy
    end
    if exchange.destroy
      exchanges = Exchange.all
      exchanges_json = exchanges.to_json(:include => [
        :commodities, :currencies])
      render json: {
        exchanges: exchanges_json
      }
    else
      render json: {error: "Error deleting Exchange!"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange
      @exchange = Exchange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exchange_params
      params.require(:exchange).permit(:name, :id)
    end
end
