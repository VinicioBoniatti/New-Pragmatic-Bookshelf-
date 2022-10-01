
class LineItensController < ApplicationController
  skip_before_action :authorize, only: [:create, :destroy]
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_iten, only: [ :show, :edit, :update, :destroy ]

  # GET /line_itens or /line_itens.json
  def index
    @line_itens = LineIten.all
  end

  # GET /line_itens/1 or /line_itens/1.json
  def show
  end

  # GET /line_itens/new
  def new
    @line_iten = LineIten.new
  end

  # GET /line_itens/1/edit
  def edit
  end

  # POST /line_itens or /line_itens.json
  def create
    product = Product.find(params[:product_id])
    @line_iten = @cart.add_product(product)

    respond_to do |format|
      if @line_iten.save
        format.html { redirect_to store_index_url}
        format.js { @current_iten = @line_iten}
        format.json { render :show, status: :created, location: @line_iten }
      else
        format.html { render :new }
        format.json { render json: @line_iten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_itens/1 or /line_itens/1.json
  def update
    respond_to do |format|
      if @line_iten.update(line_iten_params)
        format.html { redirect_to line_iten_url(@line_iten), notice: "Line iten was successfully updated." }
        format.json { render :show, status: :ok, location: @line_iten }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_iten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_itens/1 or /line_itens/1.json
  def destroy
   
    @line_iten.destroy
    respond_to do |format|
      format.html { redirect_to store_index_url, notice: "Line iten was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_iten
      
      @line_iten = LineIten.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # Never trust parameters from the scary internet, only allow the white
    # list th
    def line_iten_params
      params.require(:line_iten).permit(:product_id)
    end
end
