class PartItemsController < ApplicationController
	
# PATCH/PUT
  def update

  	@part_item = PartItem.find(params[:id])
    respond_to do |format|
      if @part_item.update(part_item_params)
      	#Check if PO get all received Items
        format.html { redirect_to part_order_receipt_path(@part_item.part_order), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @part_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part_order.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Only allow a list of trusted parameters through.
    def part_item_params
      params.require(:part_item).permit(:received)
    end

end