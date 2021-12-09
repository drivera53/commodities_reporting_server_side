class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :update, :destroy]

  # GET /currencies
  def index
    @currencies = Currency.all

    render json: @currencies
  end

  # GET /currencies/1
  def show
    render json: @currency
  end

  # POST /currencies
  def create
    @currency = Currency.new(currency_params)

    if @currency.save
      exchanges = Exchange.all
      exchanges_json = exchanges.to_json(:include => [
        :commodities, :currencies])
      # render json: @exchange, status: :created, location: @exchange
      render json: {
        exchanges: exchanges_json
      }
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /currencies/1
  def update
    if @currency.update(currency_params)
      render json: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /currencies/1
  def destroy
    @currency.destroy
  end

  def special_destroy
    # print(exchange_params[:name])
    # print(exchange_params[:id])
    # print(exchange_params)
    # exchange = Exchange.find(params[:id])
    currency = Currency.find(currency_params[:id]) 
    if currency.destroy
      # All commodities
      currencies = Currency.all
      currencies_json = currencies.to_json(:include => [
        :name, :c_type, :settlement_date, :tenor, :price, :exchange_id, :created_at, :exchange])
      render json: {
        currencies: currencies_json
      }
    else
      render json: {error: "Error deleting Commodity!"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def currency_params
      params.require(:currency).permit(:name, :c_type, :settlement_date, :tenor, :price, :exchange_id, :id)
    end
end
