class InvestmentFundsController < ApplicationController
  before_action :set_investment_fund, only: [:show, :edit, :update, :destroy]

  # GET /investment_funds
  # GET /investment_funds.json
  def index
    @wallet_id = params[:wallet_id]
    @investment_funds = InvestmentFund.where("wallet_id = ?", @wallet_id)
  end

  # GET /investment_funds/1
  # GET /investment_funds/1.json
  def show
  end

  # GET /investment_funds/new
  def new
    @investment_fund = InvestmentFund.new
  end

  # GET /investment_funds/1/edit
  def edit
  end

  # POST /investment_funds
  # POST /investment_funds.json
  def create
    @investment_fund = InvestmentFund.new(investment_fund_params)

    respond_to do |format|
      if @investment_fund.save
        format.html { redirect_to @investment_fund, notice: 'Investment fund was successfully created.' }
        format.json { render :show, status: :created, location: @investment_fund }
      else
        format.html { render :new }
        format.json { render json: @investment_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investment_funds/1
  # PATCH/PUT /investment_funds/1.json
  def update
    respond_to do |format|
      if @investment_fund.update(investment_fund_params)
        format.html { redirect_to @investment_fund, notice: 'Investment fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @investment_fund }
      else
        format.html { render :edit }
        format.json { render json: @investment_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investment_funds/1
  # DELETE /investment_funds/1.json
  def destroy
    @investment_fund.destroy
    respond_to do |format|
      format.html { redirect_to investment_funds_url, notice: 'Investment fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment_fund
      @investment_fund = InvestmentFund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_fund_params
      params.require(:investment_fund).permit(:name, :buyDate, :admTax, :aditionalInfo, :exitTax, :fundBegin, :manager, :managerContact, :shareValue, :capital, :wallet_id)
    end
end
