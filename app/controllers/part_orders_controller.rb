class PartOrdersController < ApplicationController
  before_action :set_part_order, only: %i[ show edit update destroy ]
  layout 'dashboard'

  # GET /part_orders or /part_orders.json
  def index
    @part_orders = PartOrder.open
    @closed_part_orders = PartOrder.closed
    @all_part_orders = PartOrder.all
  end

  def search
    q = params[:q].downcase
    @parts = Part.where("mfr_number LIKE ?", "%#{q}%").limit(5)
  end

  def search_name
    q = params[:q].downcase
    @parts = Part.where("name LIKE ?", "%#{q}%").limit(5)
  end

  def search_vendor
    q = params[:q].downcase
    @vendors = Vendor.where("code LIKE ?", "%#{q}%").limit(5)
  end

  # GET /part_orders/1 or /part_orders/1.json
  def show

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", :template => 'part_orders/pdf.html.erb'   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /part_orders/new
  def new
    @part_order = PartOrder.new
    @part_order.part_items.build
  end

  # GET /part_orders/1/edit
  def edit
  end

  # POST /part_orders or /part_orders.json
  def create
    @part_order = PartOrder.new(part_order_params)

    respond_to do |format|
      if @part_order.save
        format.html { redirect_to @part_order, notice: "Part order was successfully created." }
        format.json { render :show, status: :created, location: @part_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_orders/1 or /part_orders/1.json
  def update
    respond_to do |format|
      if @part_order.update(part_order_params)
        format.html { redirect_to part_order_receipt_path(@part_order), notice: "Part order was successfully updated." }
        format.json { render :show, status: :ok, location: @part_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_orders/1 or /part_orders/1.json
  def destroy
    @part_order.destroy
    respond_to do |format|
      format.html { redirect_to part_orders_url, notice: "Part order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PO Receipt
  def receipt
    @part_order = PartOrder.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", :template => 'part_orders/receipt.html.erb'   # Excluding ".pdf" extension.
      end
    end
  end

  def receipts
    @part_orders = PartOrder.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_order
      @part_order = PartOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def part_order_params
      params.require(:part_order).permit(:part_name, :part_description, :status, :delivery_date, :vendor_id, :po_number, :vendor, :vendor_contact, :vendor_address, :quantity, :total, part_items_attributes: [:id, :description, :name, :quantity, :received, :rate, :_destroy])
    end
end
