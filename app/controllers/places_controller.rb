class PlacesController < ApplicationController
  def new
    @place = Place.new
  end

  def show
    @place = Place.find(params[:id])
    respond_to do |format|
      render json: @place
    end
  end

  def create
    @place = User.new(place_params)
    respond_to do |format|
      if @place.save
        format.json { render :show, status: :created, location: @place }
      else
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = Place.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.json { render :show, status: :ok, location: @place }
      else
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def place_params
      params.require(:place).permit(:name, :address, :capacity)
    end
end
