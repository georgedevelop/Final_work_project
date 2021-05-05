class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: %i[ show edit update destroy ]
  layout 'dashboard'

  # GET /work_orders or /work_orders.json
  def index
    @work_orders = WorkOrder.pending
    @completed_work_orders = WorkOrder.completed
    @work_order_requests = WorkOrderRequest.pending

  end

  # GET /work_orders/1 or /work_orders/1.json
  def show
  end

  # GET /work_orders/new
  def new
    @work_order = WorkOrder.new
  end

  # GET /work_orders/1/edit
  def edit
  end

  # POST /work_orders or /work_orders.json
  def create
    @work_order = WorkOrder.new(work_order_params)

    respond_to do |format|
      if @work_order.save
        format.html { redirect_to @work_order, notice: "Work order was successfully created." }
        format.json { render :show, status: :created, location: @work_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_orders/1 or /work_orders/1.json
  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        format.html { redirect_to @work_order, notice: "Work order was successfully updated." }
        format.json { render :show, status: :ok, location: @work_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1 or /work_orders/1.json
  def destroy
    @work_order.destroy
    respond_to do |format|
      format.html { redirect_to work_orders_url, notice: "Work order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def calendar
  end

  def events
    @events = WorkOrder.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_order_params
      params.require(:work_order).permit(:location, :status, :issue, :line, :recurring, :recurring_frequency, :machine, :work_order_type, :request_date_time, :level_of_issue, :requested_by, :email, :description_of_issue, :planned_date_and_time, :complete_date_and_time)
    end
end
