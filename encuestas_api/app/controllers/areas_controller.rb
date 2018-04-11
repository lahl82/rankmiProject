class AreasController < ApplicationController
  before_action :set_area, only: [:show, :update, :destroy]

  # GET /areas
  def index
    @areas = Area.all
    json_response(@areas)
  end

  # POST /areas
  def create
    @area = area.create!(area_params)
    json_response(@area, :created)
  end

  # GET /areas/:id
  def show
    json_response(@area)
  end

  # PUT /areas/:id
  def update
    @area.update(area_params)
    head :no_content
  end

  # DELETE /areas/:id
  def destroy
    @area.destroy
    head :no_content
  end

  private

  def area_params
    params.permit(:name, :result, :parent)
  end

  def set_area
    @area = Area.find(params[:id])
  end
end
