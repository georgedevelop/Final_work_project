class WorkOrderRequestsController < ApplicationController
  before_action :set_work_order_request, only: %i[ show edit update destroy ]
  layout 'dashboard'

  # GET /work_order_requests or /work_order_requests.json
  def index
    @work_order_requests = WorkOrderRequest.all
  end

  # GET /work_order_requests/1 or /work_order_requests/1.json
  def show
  end

  # GET /work_order_requests/new
  def new
    @work_order_request = WorkOrderRequest.new
  end

  # GET /work_order_requests/1/edit
  def edit
  end

  # POST /work_order_requests or /work_order_requests.json
  def create
    @work_order_request = WorkOrderRequest.new(work_order_request_params)

    respond_to do |format|
      if @work_order_request.save
        format.html { redirect_to @work_order_request, notice: "Work order request was successfully created." }
        format.json { render :show, status: :created, location: @work_order_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_order_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_order_requests/1 or /work_order_requests/1.json
  def update
    respond_to do |format|
      if @work_order_request.update(work_order_request_params)
        format.html { redirect_to @work_order_request, notice: "Work order request was successfully updated." }
        format.json { render :show, status: :ok, location: @work_order_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_order_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_order_requests/1 or /work_order_requests/1.json
  def destroy
    @work_order_request.destroy
    respond_to do |format|
      format.html { redirect_to work_order_requests_url, notice: "Work order request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Confirm
  def confirm
    @work_order_request = WorkOrderRequest.find(params[:id])
    @work_order_request.confirm

    redirect_to work_orders_path
  end

  # Deny
  def deny
    @work_order_request = WorkOrderRequest.find(params[:id])
    @work_order_request.deny

    redirect_to work_orders_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order_request
      @work_order_request = WorkOrderRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_order_request_params
      params.require(:work_order_request).permit(:location, :issue, :line, :machine, :work_order_type, :request_date_time, :level_of_issue, :requested_by, :email, :description_of_issue, :planned_date_and_time, :complete_date_and_time, :recurring)
    end
end
