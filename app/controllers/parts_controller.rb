class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_active_storage_host
  before_action :force_json, only: :search
  layout 'dashboard'

  def set_active_storage_host
    ActiveStorage::Current.host = 'http://localhost:3000' if ActiveStorage::Current.host.blank?
    true
  end

  # GET /parts or /parts.json
  def index
    @parts = Part.all
  end

  def search
    
    if params.has_key?(:q)
      q = params[:q].downcase
      @parts = Part.where("barcode LIKE ?", "%#{q}%").limit(5)
    elsif params.has_key?(:mfr_number)
      mfr = params[:mfr_number].downcase
      @parts = Part.where("mfr_number LIKE ?", "%#{mfr}%").limit(5)
    elsif params.has_key?(:machine)
      machine = params[:machine].downcase
      @parts = Part.where("machine LIKE ?", "%#{machine}%").limit(5)
    elsif params.has_key?(:location)
      location = params[:location].downcase
      @parts = Part.where("location LIKE ?", "%#{location}%").limit(5)
    end

  end

  # GET /parts/1 or /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts or /parts.json
  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: "Part was successfully created." }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1 or /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part, notice: "Part was successfully updated." }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1 or /parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url, notice: "Part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    def force_json
      request.format = :json
    end

    # Only allow a list of trusted parameters through.
    def part_params
      params.require(:part).permit(:name, :description, :location, :quantity, :mfr_number, :barcode, :machine, :main_image, vendor_ids: [])
    end
end
