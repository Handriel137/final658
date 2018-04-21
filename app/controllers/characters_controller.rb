class CharactersController < ApplicationController

  before_action :set_character, only: [:show, :update, :destroy]

  # GET /characters
  def index
    @characters = Character.all
    json_response(@characters)
  end

  # POST /characters
  def create
    @character = Character.create!(character_params)
    json_response(@character, :created)
  end

  # GET /characters/:id
  def show
    json_response(@character)
  end

  # PUT /characters/:id
  def update
    @character.update(character_params)
    head :no_content
  end

  # DELETE /characters/:id
  def destroy
    @character.destroy
    head :no_content
  end

  private

  def character_params
    # whitelist params
    params.permit(:name, :job, :level, :player)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end