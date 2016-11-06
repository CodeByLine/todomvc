class ItemsController < ApplicationController
  def create
  	# raise params.inspect
	@list = List.find(params[:list_id])
  # @items = @list.items.new unless @items.blank?
	@item = @list.items.build(item_params)
  	# @item = Item.new(item_params)
  	if @item.save
  		redirect_to list_path(@list)
  	else
  		render "lists/show"
  	end
  end


    # PATCH - /lists/:list_id/items/:id
    def update
      # raise params.inspect
      @item = Item.find(params[:id])
      @item.update(item_params)

      # @list=List.find(params[:list_id])   # These 2 lines make it more secure
      # @item = @list.items.find(params[:id])

      # @item.status =params[:item][:status]  # Replaced by @item.update(item_params)
      # @item.save    # Replaced by @item.update(item_params)

      redirect_to list_path(@item.list)
    end

    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to list_path(@item.list)
    end

  private

  def item_params

  	params.require(:item).permit(:description, :status)
  end

end
