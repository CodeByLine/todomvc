class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.all
    # render 'lists/index.html.erb'
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new
    # @item = @list.items.build #This replaces the line in show.html.erb which exposes the model
  end

  def new
    @list = List.new
    redirect_to lists_path
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_url(@list)
    else
      @lists = List.all
      render :index
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

    def list_params
      params.require(:list).permit(:name)
    end
end
