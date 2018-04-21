class ItemsController < ApplicationController
  before_action :set_character
  before_action :set_character_item, only: [:show, :update, :destroy]

  # GET /characters/:character_id/items
  def index
    json_response(@character.items)
  end

  # GET /characters/:character_id/items/:id
  def show
    json_response(@item)
  end

  # POST /characters/:character_id/items
  def create
    @character.items.create!(item_params)
    json_response(@character, :created)
  end

  # PUT /characters/:character_id/items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /characters/:character_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :rarity)
  end

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_character_item
    @item = @character.items.find_by!(id: params[:id]) if @character
  end
end