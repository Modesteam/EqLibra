class DirectTreasuriesController < ApplicationController
  before_action :set_direct_treasury, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /direct_treasuries
  # GET /direct_treasuries.json
  def index
    @wallet_id = params[:wallet_id]
    @direct_treasuries = DirectTreasury.where("wallet_id = ?", @wallet_id)
  end

  # GET /direct_treasuries/1
  # GET /direct_treasuries/1.json
  def show
  end

  # GET /direct_treasuries/new
  def new
    @direct_treasury = DirectTreasury.new
  end

  # GET /direct_treasuries/1/edit
  def edit
  end

  # POST /direct_treasuries
  # POST /direct_treasuries.json
  def create
    @direct_treasury = DirectTreasury.new(direct_treasury_params)

    respond_to do |format|
      if @direct_treasury.save
        format.html { redirect_to @direct_treasury, notice: 'Direct treasury was successfully created.' }
        format.json { render :show, status: :created, location: @direct_treasury }
      else
        format.html { render :new }
        format.json { render json: @direct_treasury.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direct_treasuries/1
  # PATCH/PUT /direct_treasuries/1.json
  def update
    respond_to do |format|
      if @direct_treasury.update(direct_treasury_params)
        format.html { redirect_to @direct_treasury, notice: 'Direct treasury was successfully updated.' }
        format.json { render :show, status: :ok, location: @direct_treasury }
      else
        format.html { render :edit }
        format.json { render json: @direct_treasury.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direct_treasuries/1
  # DELETE /direct_treasuries/1.json
  def destroy
    @direct_treasury.destroy
    respond_to do |format|
      format.html { redirect_to wallets_path, notice: 'Direct treasury was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direct_treasury
      @direct_treasury = DirectTreasury.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direct_treasury_params
      params.require(:direct_treasury).permit(:title, :buyDate, :dueDate, :investment_value, :acquisitionsTax, :admTax, :wallet_id)
    end
end
